getAttribute - получение атрибута соединения с СУБД
    mixed PDO::getAttribute(int attribute)

Описание
========

Метод возвращает значение одного из атрибутов соединения с СУБД.

Аргументы
=========

* attribute - код атрибута (некоторые СУБД не поддерживают всех перечисленных ниже кодов):
    * PDO::ATTR_AUTOCOMMIT
    * PDO::ATTR_CASE
    * PDO::ATTR_CLIENT_VERSION
    * PDO::ATTR_CONNECTION_STATUS
    * PDO::ATTR_DRIVER_NAME
    * PDO::ATTR_ERRMODE
    * PDO::ATTR_ORACLE_NULLS
    * PDO::ATTR_PERSISTENT
    * PDO::ATTR_PREFETCH
    * PDO::ATTR_SERVER_INFO
    * PDO::ATTR_SERVER_VERSION
    * PDO::ATTR_TIMEOUT

Возвращаемое значение
=====================

Значение указанного атрибута СУБД.
