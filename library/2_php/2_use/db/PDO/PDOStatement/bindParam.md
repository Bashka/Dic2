bindParam - установка значения параметру подготовленного запроса
    bool PDOStatement::bindParam(mixed parameter, mixed &variable, [int data_type, [int length]])

Описание
========

Метод связывается заданную переменную с параметром подготовленного запроса. Значение этого параметра вычисляется в момент выполнения запроса (execute).

Аргументы
=========

* parameter - имя (для именованного параметра) с ведущим двоеточием или порядковый номер (для не именованного параметра начиная с 1) параметра;
* variable - связываемая переменная;
* data_type - тип значения:
    * PDO::PARAM_BOOL - логическое значение;
    * PDO::PARAM_INT - целое число;
    * PDO::PARAM_NULL - null;
    * PDO::PARAM_STR - строка.
* length - размер данных.

Возвращаемое значение
=====================

Возвращает True в случае успешного завершения и False в случае ошибки.

Пример использования
====================

Связывание не именованных параметров запроса:

    $sql = $db->prepare('SELECT * FROM myTable WHERE name = ?');
    $name = 'firstName';
    $sql->bindParam(1, $name);
    $sql->execute();
    $name = 'secondName';
    $sql->execute();

Связывание не именованных параметров запроса:

    $sql = $db->prepare('SELECT * FROM myTable WHERE name = :name');
    $name = 'firstName';
    $sql->bindParam(':name', $name);
    $sql->execute();
    $name = 'secondName';
    $sql->execute();
