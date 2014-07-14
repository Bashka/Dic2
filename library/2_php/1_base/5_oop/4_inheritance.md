Наследование
Наследование классов
====================

Наследование в PHP реализуется с использованием ключевого слова `extends`. Ниже приведен пример двух классов с наследованием:

    class Parent{
      protected $foo = 'Hello world';
    }
    class Child extends Parent{
      public function getParentFoo(){
        return $this->foo;
      }
    }

Переопределение методов
=======================

Если в дочернем класса объявлен метод с тем же именем, что и в родительском, то этот метод называется переопределяющим. Ниже приведен пример переопределения метода класса:

    class Parent{
      public function method(){
        echo 'Parent';
      }
    }
    class Child extends Parent{
      public function method(){
        echo 'Child';
      }
    }
    $parent = new Parent();
    $parent->method(); // Parent - вызов метода родителя.
    $child = new Child();
    $child->method(); // Child - вызов переопределяющего метода.

Если из переопределяющего метода необходимо обратиться к переопределяемому методу, используется полное имя метода или ключевое слово `parent`:

    class Parent{
      public function method(){
        echo 'Parent';
      }
    }
    class ChildA extends Parent{
      public function method(){
        parent::method(); // Доступ к методу прямого родителя.
      }
    }
    class ChildB extends Parent{
      public function method(){
        Parent::method(); // Доступ к методу класса Parent.
      }
    }

Абстракции
==========

Если класс объявлен абстрактным, его дочерний класс обязан реализовать все его абстрактные методы:

    abstract class Parent{
      public abstract function method();
    }
    class Child extends Parent{
      public function method(){
        // Реализация абстрактного метода.
      }
    }

Это правило не распространяется на те дочерние классы, которые сами являются абстрактными.
