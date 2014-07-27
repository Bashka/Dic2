DOMNode - базовый класс, представляющий узлы XML документа

Описание
========

Данный класс наследуется всеми подклассами, представляющими узлы XML документа.

Свойства
========

* string nodeName - имя узла;
* DOMNode parentNode - родительский узел;
* DOMNodeList childNodes - множество дочерних узлов;
* DOMNode firstChild - первый дочерний узел;
* DOMNode lastChild - последний дочерний узел;
* DOMNode previousSibling - соседний узел слева;
* DOMNode nextSibling - соседний узел справа;
* DOMDocument - документ, которому принадлежит узел;
* string namespaceURI - пространство имен, к которому относится узел.
