cloneNode - клонирование узла
    DOMNode DOMNode::cloneNode([bool deep])

Описание
========

Метод клонирует указанный узел.

Если клон необходимо вставить в другой XML документ, предварительно необходимо выполнить метод importNode.

Аргументы
=========

* deep - применять ли рекурсивное клонирование узла (True) или нет (False - по умолчанию).

Возвращаемое значение
=====================

Клон узла.

Пример использования
====================

Рекурсивное клонирование первого узла документа с последующей вставкой в качестве последнего узла:

    $clone = $xml->documentElement->firstChild->cloneNode(true);
    $xml->documentElement->appendChild($clone);

Вставка узла одного документа в другой:

    $clone = $xmlA->documentElement->firstChild->cloneNode(true);
    $xmlB->importNode($clone, true);
    $xmlB->documentElement->appendChild($clone);
