Описание схемы
Заголовок схемы
===============

Для добавления заголовка схеме используется следующая запись:

    title описание

Ниже приведен пример использования заголовка схемы:

    @startuml
    title Simple <b>example</b>\nof title 
    Object <|-- ArrayList
    @enduml

В результате компиляции такого файла, будет получена схема, изображенная на рисунке:

![Схема классов PlantUML](storage/imgs/plantUML/classes/description/title.png)

Легенда схемы
=============

Для добавления легенды схеме используется следующая конструкция:

    legend расположение
      <b>Object</b> and <b>ArrayList</b>
      are simple class
    endlegend

Легенда может "располагаться" в следующих направлениях:

* `center` - по центру;
* `right` - справа;
* `left` - слева.

Ниже приведен пример использования легенды в схеме:

    @startuml
    Object <|- ArrayList
    legend center
      <b>Object</b> and <b>ArrayList</b>
      are simple class
    endlegend
    @enduml

В результате компиляции такого файла, будет получена схема, изображенная на рисунке:

![Схема классов PlantUML](storage/imgs/plantUML/classes/description/legend.png)
