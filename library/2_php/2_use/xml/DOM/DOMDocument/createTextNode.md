createTextNode - создание текстового узла
    DOMText|bool DOMDocument::createTextNode(string content)

Описание
========

Метод создает текстовый узел.

Аргументы
=========

* content - значение узла.

Возвращаемое значение
=====================

Текстовый узел или False в случае ошибки.

Пример использования
====================

Создание текстового узла для нового узла документа:

    $xml = new DOMDocument();
    $xml->load('file.xml');
    $node = $xml->createElement('newNode');
    $textNode = $xml->createTextNode('Hello world'); // Создание текстового узла.
    $node->appendChild($textNode);
    $xml->documentElement->appendChild($node); // Добавление узла в документ.
