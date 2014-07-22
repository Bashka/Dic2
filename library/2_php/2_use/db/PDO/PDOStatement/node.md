PDOStatement

Описание
========

Класс PDOStatement представляет подготовленный запрос к СУБД, а после его выполнения, соответствующий, результирующий набор данных.

Пример использования
====================

Подключение к СУБД MySQL:

    $db = new PDO('mysql:dbname=test;host=localhost', 'root', '123');
    $statement = $db->query('SELECT * FROM myTable'); // Получение объекта PDOStatement.
    foreach($statement as $row){
      echo $row[0] . "\t" . $row[1] . "\n";
    }
