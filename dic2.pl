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
  print 'q] Выход.'."\n";
  print "\n";

  # Формирования списка вложенных узлов только для каталога.
  if(-d $home . $_[0]){
    opendir(NODE, $home . $_[0]);
    my @subnodes = sort(readdir(NODE));
    closedir(NODE);
    my $nodeIndex = 1;
    for my $subnode (@subnodes){
      if($subnode ne '.' && $subnode ne '..' && $subnode ne 'node.dic2'){
        $menu[$nodeIndex] = $_[0].'/'.$subnode;

        my $subnodeAddr = $home.$_[0].'/'.$subnode;
        # Вставка переноса строки для файлов, имена которых [0-9]+_
        if($subnode =~ m/^[0-9]+_$/){
          print "\n";
        }
        else{
          # Печать элемента меню на основании содержимого описательного файла каталога или целевого файла.
          $subnodeAddr = $subnodeAddr . '/node.dic2' if -d $subnodeAddr;
          open(SUBNODE, '<:utf8', $subnodeAddr);
          print $nodeIndex++.'] '.<SUBNODE>;
          close(SUBNODE);
        }
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
  $nodeAddr = $nodeAddr . '/node.dic2' if -d $nodeAddr;
  open(TEXTFILE, '<:utf8', $nodeAddr) or die('Невозможно открыть файл: '.$nodeAddr);
  <TEXTFILE>;
  print <TEXTFILE>;
  close(TEXTFILE);

  print "\n".'---Меню---'."\n";
  showMenu($_[0]);
}

# Определение начального узла.
my $currentNode = 'library';
if($#ARGV + 1 != 0){
  $currentNode = $ARGV[0];
}

# Текущая команда.
my $cmd;
do{
  system('clear');
  showNode($currentNode);
  print 'Выберите узел: ';
  $cmd = <STDIN>;
  # Возврат к предыдущему узлу.
  if($cmd eq "b\n" || $cmd eq "\n"){
    $currentNode =~ s/\/[A-Za-z0-9_.]+$//;
  }
  # Редактирование текущего узла.
  elsif($cmd eq "e\n"){
    system(($ENV{'EDITOR'} || 'nano') . ' ' . 
           $home . $currentNode . ((-d $home . $currentNode)? '/node.dic2' : ''));
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
