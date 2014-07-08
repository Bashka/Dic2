Структура XSD документа
Корневой элемент
================

XML схема, как и любой XML документ, начинается с декларации 'xml', за которой следует корневой элемент.

Корневой элемент XML схемы называется 'schema' и принадлежит пространству имен 'http://www.w3.org/2001/XMLSchema', этому же пространству принадлежат все его вложенные элементы. Как правило пространство имен указывается в XML схемах через префикс.

Ниже приведен пример простой XML схемы:

    <?xml version="1.0" encoding="UTF-8"?>
    <schema xmlns="http://www.w3.org/2001/XMLSchema" targetNamespace="http://foo.bar/mySchema">
      ...
    </schema>

Данная схема описывает пространство 'http://foo.bar/mySchema' (указано в атрибуте targetNamespace). Это означает, что все элементы, описываемые в данной XML схеме будут принадлежать данному пространству имен в XML документе.

Для определения корневого элемента XML файла, описываемого с помощью данной схемы, используется запись вида:

    <?xml version="1.0" encoding="UTF-8"?>
    <schema xmlns="http://www.w3.org/2001/XMLSchema" targetNamespace="имяОписываемогоПространстваИмен">
      <element name="имяКорневогоЭлемента" type="типЭлемента"/>
      ...
    </schema>

Элементы XML схемы
==================

XML схемы могут описывать следующие элементы:

* Теги;
* Атрибуты;
* Простые типы данных (числа, строки и так далее);
* Сложные типы данных (вложенные теги).

Многофайловые XML схемы
=======================

Если XML схема получается слишком большая для одного файла, ее можно разбить на несколько. При этом все XML схемы должны реализовываться одинакого, а подключаться в другие схемы с помощью следующего тега:

    <import schemaLocation="имяФайлаСхемы" namespace="пространствоИмен"/>

Данная запись импортирует все элементы из "файла схемы" в данный файл под заданным "пространством имен". Подключаемая схема должна описывать указанное "пространство имен" с помощью атрибута 'targetNamespace' тега 'schema'.

Ниже приведен пример подключаемой и подключающей схемы:

    Подключаемая схема:
    <?xml version="1.0" encoding="UTF-8"?>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
               targetNamespace="http://my.com/MyType">
      <xs:complexType name="myType">
        <xs:sequence>
          <xs:element name="foo" type="xs:string"/>
          <xs:element name="bar" type="xs:string"/>
        </xs:sequence>
      </xs:complexType>
    </xs:schema>
   
    Подключающая схема: 
    <?xml version="1.0" encoding="UTF-8"?>
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
         xmlns:im="http://my.com/MyType">
      <xs:import schemaLocation="c.xsd" namespace="http://my.com/MyType"/>
      <xs:element name="root" type="im:myType"/>
    </xs:schema>
