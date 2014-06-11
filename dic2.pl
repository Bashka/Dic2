#!/usr/bin/perl
use warnings;
use strict;
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
sub showMenu($){
  @menu = ();
  if($_[0] ne 'library'){
    print 'b] Назад.'."\n";
  }
  print 'e] Редактировать.'."\n";
  print 'u] Обновить.'."\n";
  print 'q] Выход.'."\n";
  print "\n";

  # Формирования списка вложенных узлов только для каталога.
  if(-d $home . $_[0]){
    opendir(NODE, $home . $_[0]);
    my @subnodes = sort(readdir(NODE));
    closedir(NODE);
    my $nodeIndex = 1;
    for my $subnode (@subnodes){
      if($subnode ne '.' && $subnode ne '..' && $subnode ne 'node.md'){
        $menu[$nodeIndex] = $_[0].'/'.$subnode;

        my $subnodeAddr = $home.$_[0].'/'.$subnode;
        $subnodeAddr = $subnodeAddr . '/node.md' if -d $subnodeAddr;
        open(SUBNODE, '<:utf8', $subnodeAddr);
        # Вставка переноса строки для файлов, имена которых [0-9]+_
        if($subnode =~ m/^[0-9]+_$/){
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
}

##
# Функция выводит на экран текст узла.
# @param string Адрес целевого узла в файловой системе относительно домашнего каталога утилиты.
##
sub showNode($){
  my $nodeAddr = $home . $_[0];
  $nodeAddr = $nodeAddr . '/node.md' if -d $nodeAddr;
  open(TEXTFILE, '<:utf8', $nodeAddr) or die('Невозможно открыть файл: '.$nodeAddr);
  <TEXTFILE>;
  print <TEXTFILE>;
  close(TEXTFILE);
}

# Определение начального узла.
my $currentNode = 'library';
if($#ARGV + 1 != 0){
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
  print "\n".'---Меню---'."\n";
  showMenu($currentNode);
  print 'Выберите узел: ';
  $cmd = <STDIN>;
  # Возврат к предыдущему узлу.
  if($cmd eq "b\n" || $cmd eq "\n"){
    $currentNode =~ s/\/[A-Za-z0-9_.]+$//;
  }
  # Редактирование текущего узла.
  elsif($cmd eq "e\n"){
    system(($ENV{'EDITOR'} || 'nano') . ' ' . 
           $home . $currentNode . ((-d $home . $currentNode)? '/node.md' : ''));
  }
  # Обновление библиотеки.
  elsif($cmd eq "u\n"){
    system('git pull');
  }
  # Выход из программы.
  elsif($cmd eq "q\n"){
    exit 0;
  }
  # Выбор узла.
  elsif($cmd =~ m/[0-9]/){
    $currentNode = $menu[$cmd];
  }
}while(1);
