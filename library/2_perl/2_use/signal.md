Обработка сигналов
Хэш SIG
=======

Стандартным средством обработки сигналов в Perl является хэш SIG. В качестве ключей данного хэша задаются имена обрабатываемых сигналов, а в качестве значений ссылки на функции-обработчики.

Ниже приведен пример обработки сигнала INT с помощью функции-обработчика:

    sub f(){
      print 'Hello world';
      die();
    }
    $SIG{'INT'} = \&f;

Прагма sigtrap
==============

Для обработки сигналов в Perl можно использовать прагму sigtrap, которая определяет реакцию на различные сигналы для данного скрипта. В отличии от хэша SIG, данная прагма включает несколько механизмов, упрощающих обработку сигналов.

Данная прагма имеет следующие аргументы:

* Обработчик сигнала - метод обработки сигнала:
    * `stack-trace` - вывод трасировки сигнала в STDERR;
    * `die` - завершение работы скрипта с выводом информации об ошибке в STDERR;
    * `handler <обработчик>` - использование пользовательской функции-обработчика сигнала.
* Список обрабатываемых сигналов - перечисление имен сигналов, обрабатываемых данным обработчиком. Сюда могут входить как имена сигналов, так и следующие группы:
    * normal-signals - HUP, INT, PIPE и TERM;
    * error-signals - ABRT, BUS, EMT, FPE, ILL, QUIT, SEGV, SYS и TRAP;
    * old-interface-signals - ABRT, BUS, EMT, FPE, ILL, PIPE, QUIT, SEGV, SYS, TERM, и TRAP.

Ниже приведен пример программы, завершающей работу при появлении сигнала INT:

    use sigtrap('die', 'INT');

Ниже приведен пример программы, обрабатывающей сигнал INT с помощью пользовательской функции:

    sub f(){
      print 'Hello world';
      die();
    }
    use sigtrap('handler', 'f', 'INT');
