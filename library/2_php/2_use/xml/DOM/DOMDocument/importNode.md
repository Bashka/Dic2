importNode - вставка узла в документ из другого документа
    DOMNode|bool DOMDocument::importNode(DOMNode importedNode, [bool deep])

Описание
========

Метод подготавливает узел из другого документа к вставке в документ.

Аргументы
=========

* importedNode - импортируемый узел;
* deep - применять ли рекурсивный импорт узла (True) или нет (False - по умолчанию).

Возвращаемое значение
=====================

Импортируемый узел или False в случае ошибки.

Пример использования
====================

Вставка узла одного документа в другой:

    $clone = $xmlA->documentElement->firstChild->cloneNode(true);
    $xmlB->importNode($clone, true);
    $xmlB->documentElement->appendChild($clone);
