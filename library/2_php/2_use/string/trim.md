trim - удаление пробельных символов с начала и конца строки
    string trim(string str, [string charlist])

Описание
========

Функция удаляет пробельные или указанные символы с начала и конца строки.

Аргументы
=========

* str - исходная строка;
* charlist - строка, в которой перечислены удаляемые символы (можно указать диапазон с помощью `..`).

Возвращаемое значение
=====================

Исходная строка с удаленными пробельными или указанными символами в начале и конце.

Пример использования
====================

Удаление пробелов:

    echo trim('  Hello world  '); // 'Hello world'
