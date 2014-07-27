DOMDocument - представление XML документа
    __construct([string version, [string encoding]])

Описание
========

Класс представляет XML документ.

Аргументы
=========

* version - версия нового XML документа (по умолчанию 1.0);
* encoding - кодировка нового XML документа (по умолчанию UTF-8).

Семантика
=========

    class  DOMDocument extends DOMNode

Свойства
========

* string version - версия документа;
* string encoding - кодировка документа;
* DOMElement documentElement - корневой элемент документа.
