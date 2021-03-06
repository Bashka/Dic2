Строки
Операции над строками
=====================

Для строк определены следующие операции:

* `.` - конкатенация строк.

Для приведения значения к строчному типу, используется следующая функция:

    string(<значение>)

Строки в двойных кавычках обрабатываются на предмет нахождения и замены в них следующих спецсимволов:

* `\<число>` - трехзначный код символа;
* `\x<hex>` - шестнадцатиричный код символа;
* `\u<hex>` - шестнадцатиричный код символа в кодировке Unicode;
* `\b` - backspace (<BS>);
* `\e` - escape (<Esc>);
* `\n` - newline (<NL>);
* `\r` - return (<CR>);
* `\t` - tab (<Tab>);
* `\<имя>` - спецсимволы (на пример `\<C-W>`, `\<F1>`).

Для работы со строками определены следующие функции

* `string(<значение>)` - приведение значения к строчному типу;
* `strlen(<строка>)` - определение длины строки в байтах;
* `strchars(<строка>)` - определение числа символов в строке;
* `stridx(<строка>, <искомое>[, <начало>])` - поиск подстроки в строке (возвращается -1 если подстрока не найдена);
* `strridx(<строка>, <искомое>[, <начало>])` - поиск подстроки в строке справа налево (возвращается -1 если подстрока не найдена);
* `strpart(<строка>, <начало>[, <длина>])` - получение подстроки из строки. Если "длина" не задана, выделяется вся подстрока от позиции "начала" (отсчет ведется от нуля) до конца строки.
* `match(<строка>, <шаблон>)` - поиск вхождений подстроки в строку по регулярному выражению. Функция возвращает ноль, если в строке не найдено ни одного соответствия;
* `matchlist(<строка>, <шаблон>)` - поиск и возврат массива подстрок (не более 9) по регулярному выражению;
* `substitute(<строка>, <шаблонПоиска>, <замена>, <флаги>)` - поиск с заменой в строке. Все аргументы функции строчные и обязательные. Если перед заменой необходимо выполнить некоторый VimScript, используется следующая строка '\=скрипт';
* `split(<строка>, <разделитель>)` - разделение строки в массив;
* `join(<массив>, <разделитель>)` - объединение элементов массива в строку с помощью разделителя.
