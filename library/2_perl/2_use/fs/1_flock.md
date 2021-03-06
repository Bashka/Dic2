flock - блокировка файла
    flock(fh, mode)

Описание
========

Функция блокирует указанный файловый дескриптор исключительной или разделяемой блокировкой, а так же снимает блокировку.

Аргументы
=========

* fh - скалярная переменная, ссылающаяся на целевой файловый дескриптор;
* mode - режим блокировки. Разлечаются следующие режимы:
    * 1 - разделяемая (только чтение);
    * 2 - исключительная (полная блокировка);
    * 8 - снятие блокировки.

Возвращаемое значение
=====================

Функция возвращает True в случае успешного завершения и False в случае ошибки.

Пример использования
====================

Блокировка файла и ее последующее снятие:

    open(my $fh, '+<', 'file.txt');
    flock($fh, 2);
    flock($fh, 8);
    close($fh);
