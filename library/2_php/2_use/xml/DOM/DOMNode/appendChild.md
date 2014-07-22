appendChild - добавление дочернего узла в конец
    DOMNode DOMNode::appendChild(DOMNode newnode)

Описание
========

Метод вставляет указанный узел в конец дочерних узлов вызываемого объекта.

Аргументы
=========

* newnode - добавляемый узел.

Возвращаемое значение
=====================

Добавленный узел.

Пример использования
====================

Добавление нового узла:

    $xml = new DOMDocument();
    $xml->load('file.xml');
    $node = $xml->createElement('newNode');
    $xml->documentElement->appendChild($node); // Добавление узла в документ.
