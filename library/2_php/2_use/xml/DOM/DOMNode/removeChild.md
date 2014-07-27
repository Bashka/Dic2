removeChild - удаление дочернего узла
    DOMNode DOMNode::removeChild(DOMNode oldnode)

Описание
========

Метод удаляет заданный дочерний узел.

Аргументы
=========

* oldnode - удаляемый узел.

Возвращаемое значение
=====================

Удаленный узел.

Пример использования
====================

Удаление узла:

    $node = $xml->getElementById('parentNode');
    $node->removeChild($node->firstChild); // Удаление первого дочернего узла.
