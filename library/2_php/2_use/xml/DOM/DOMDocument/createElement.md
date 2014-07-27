createElement - создание XML узла
    DOMElement|bool DOMDocument::createElement(string name)

Описание
========

Метод создает и возвращает XML узел.

Аргументы
=========

* name - имя создаваемого узла.

Возвращаемое значение
=====================

Полученный XML узел или False в случае ошибки.

Пример использования
====================

Добавление нового узла в документ:

    $xml = new DOMDocument();
    $xml->load('file.xml');
    $node = $xml->createElement('newNode'); // Создание узла.
    $xml->documentElement->appendChild($node); // Добавление узла в документ.
