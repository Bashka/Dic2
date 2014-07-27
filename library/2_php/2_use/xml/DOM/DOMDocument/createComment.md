createComment - создание узла комментария
    DOMComment|bool DOMDocument::createComment(string data)

Описание
========

Метод создает узел комментария.

Аргументы
=========

* data - значение узла.

Возвращаемое значение
=====================

Узел комментария или False в случае ошибки.

Пример использования
====================

Добавление комментария в документ:

    $xml = new DOMDocument();
    $xml->load('file.xml');
    $comm = $xml->createComment('Hello world'); // Создание комментария.
    $xml->documentElement->appendChild($comm); // Добавление узла в документ.
