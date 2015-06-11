#!/usr/bin/perl
use warnings;
use strict;
use autodie;
use utf8;
binmode(STDOUT, 'utf8');

# Домашний каталог утилиты.
my $home = $ENV{'HOME'} . '/.dic2/';
# Индекс адресов узлов по номерам текущего меню.
my @menu = ();

##
# Функция формирует и выводит меню для узла.
# @param string Адрес целевого узла в файловой системе.
##
sub showMenu{
  my ($path) = @_;
  @menu = ();
  print "b] Назад.\n" unless $path eq 'library';
  print "e] Редактировать.\n";
  print "u] Обновить.\n";
  print "q] Выход.\n\n";

  # Формирования списка вложенных узлов только для каталога.
  if(-d $home . $path){
    opendir(NODE, $home . $path);
    my @subnodes = sort(grep { !/^(\.\.?|node\.md)$/ } readdir(NODE));
    closedir(NODE);
    my $nodeIndex = 1;
    for my $subnode (@subnodes){
      $menu[$nodeIndex] = $path.'/'.$subnode;

      my $subnodeAddr = $home.$path.'/'.$subnode;
      $subnodeAddr = $subnodeAddr . '/node.md' if -d $subnodeAddr;
      open(SUBNODE, '<:utf8', $subnodeAddr);
      # Вставка переноса строки для файлов, имена которых \d+_
      if($subnode =~ m/^\d+_$/){
        print "\n".<SUBNODE>;
      }
      # Печать элемента меню на основании содержимого описательного файла каталога или целевого файла.
      else{
        print $nodeIndex++.'] '.<SUBNODE>;
      }
      close(SUBNODE);
    }
  }
}

##
# Функция выводит на экран текст узла.
# @param string Адрес целевого узла в файловой системе относительно домашнего каталога утилиты.
##
sub showNode($){
  my $nodeAddr = $home . $_[0];
  $nodeAddr = $nodeAddr . '/node.md' if -d $nodeAddr;
  open(TEXTFILE, '<:utf8', $nodeAddr);
  print <TEXTFILE>;
  close(TEXTFILE);
}

# Определение начального узла.
my $currentNode = 'library';
if(@ARGV){
  if($ARGV[0] eq '-r'){
    $currentNode = $ARGV[1];
    showNode($currentNode);
    exit(0);
  }
  else{
    $currentNode = $ARGV[0];
  }
}

# Текущая команда.
my $cmd;
do{
  system('clear');
  showNode($currentNode);
  print "\n---Меню---\n";
  showMenu($currentNode);
  print 'Выберите узел: ';
  $cmd = <>;
  chomp $cmd;
  # Возврат к предыдущему узлу.
  if($cmd eq 'b' || not $cmd){
    $currentNode =~ s/\/[^\/]+$//;
  }
  # Редактирование текущего узла.
  elsif($cmd eq 'e'){
    system(($ENV{'EDITOR'} || 'nano') . ' ' . 
           $home . $currentNode . ((-d $home . $currentNode)? '/node.md' : ''));
  }
  # Обновление библиотеки.
  elsif($cmd eq 'u'){
    system('cd ' . $home . ' && git pull');
  }
  # Выход из программы.
  elsif($cmd eq 'q'){
    exit 0;
  }
  # Выбор узла.
  elsif($cmd =~ m/\d/ and exists($menu[$cmd])){
    $currentNode = $menu[$cmd];
  }
}while(1);
