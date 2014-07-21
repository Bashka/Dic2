query - выполнение запроса в СУБД
    PDOStatement PDO::query(string statement)

Описание
========

Метод передает неподготовленный запрос в СУБД.

Аргументы
=========

* statement - SQL запрос в виде строки.

Возвращаемое значение
=====================

Объект, представляющий ответ СУБД.

Пример использования
====================

Выполнение запроса на получение данных из СУБД:

    $db = new PDO('mysql:dbname=test;host=localhost', 'root', '123');
    $result = $db->query('SELECT * FROM myTable');
    foreach ($result as $row) {
      echo $row['name'] . "\t";
      echo $row['date'] . "\n";
    }
