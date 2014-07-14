Полиморфизм
Полиморфизм классов
===================

Аргумент функции или метода может быть типизирован классом или интерфейсом. В качестве такого аргумента может быть передан объект данного класса, или его дочернего класса, что реализует полиморфное поведение объекта. Аналогично может быть передан объект любого класса, реализующего типизирующий интерфейс.

Ниже приведен пример полиморфного поведения класса:

    interface Driver{
      public function connect();
      public function query($SQL);
    }
    class MySQL implements Driver{
      public function connect(){
        // ...
      }
      public function query($SQL){
        // ...
      }
    }
    class PostgreSQL implements Driver{
      public function connect(){
        // ...
      }
      public function query($SQL){
        // ...
      }
    }
    function sayQuery(Driver $driver, $SQL){
      $driver->connect();
      return $driver->query($SQL);
    }
    $obj = new MySQL();
    sayQuery($obj); // Использование объекта класса MySQL.
    $obj = new PostgreSQL();
    sayQuery($obj); // Использование объекта класса PostgreSQL.

Как видно из примера, функции `sayQuery` необязательно знать объект какого класса ей передан, достаточно, чтобы этот класс реализовал определенные в интерфейсе методы.
