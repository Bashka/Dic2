item - получение элемента множества
    DOMNode DOMNodelist::item(int index)

Описание
========

Метод возвращает указанный элемент множества.

Аргументы
=========

* index - индекс целевого элемента.

Возвращаемое значение
=====================

Запрашиваемый элемент множества.

Пример использования
====================

Получение первого элемента множества:

    $list = $document->documentElement->getElementsByTagName('book');
    echo $list->item(0)->nodeName;
