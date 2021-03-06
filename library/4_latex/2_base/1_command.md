Команды, окружения и параметры
Элементы языка LaTeX
==================== 
Язык LaTeX разделяет документ на:
1. Текст документа - текстовая информация, отображаемая в скомпилированном документе;
1. Комментарии - текстовая информация, не отображаемая в скомпилированном документе.
1. Команды - специальные макросы, определяющие способы отображения текстовой информации, позволяющие использовать счетчики и т.д;

Отступы и пробелы
=================

LaTeX не учитывает отступы строк от начала документа, это означает что пользователь может отбивать текст как ему удобно.

LaTeX так же заменяет любое число идущих подряд пробельных символов на один пробел, что не позволит изменять положения текста на странице с помощью пробелов, табуляций и переносов строк.

Для разделения текста на абзацы используется пустая строка:

    Это первый абзац.
    
    А это второй.

Комментарии
===========

Комментарии в LaTeX начинаются с символа %:

    Hello world % Комментарий

Команды
=======

Команда в LaTeX записывается в виде:

    \<неБуква>
    \<имя>

Первый тип команды называется не именованной. Второй тип называется именованной. Оба типа команд в процессе компиляции обрабатываются и применяются к результирующему документу.

Пробел после не именованной команды не учитывается, но учитывается перед ней.

Команды могут иметь аргументы, которые позволят изменить ее ход выполнения. Аргументы могут быть двух типов:

1. Обязательные аргументы - должны быть указаны для команды в месте ее использования обязательно и имеют вид:

    \<имя>{<параметр>,...}

1. Необязательные аргументы - могут быть указаны для команды в месте ее использования.

    \<имя>[<параметр>,...]

Оба типа аргументов могут быть указаны одновременно, при этом порядок следования каждого типа определяется самой командой:

    \<имя>{<параметр>,...}[<параметр],...]
    
Переключающие команды
---------------------

К переключающим командам относятся такие, которые начинают свое действие и оказывают влияние на весь текст документа с момента появления команды включения, и заканчивают с появлением команды отключения.

Ниже приведен пример переключающей команды, которая делает текст жирным:

    Этот текст будет \bfseries жирным\mbseries. А этот нет.

Включающей режим жирного начертания текста командой является \bfseries, а отключающей команда \mbseries.

Группы
------

Если текст в LaTeX документе заключен в фигурные скобки ({}), он называется группой. Все переключающие команды, которые были включены в группе автоматически отключаются после ее завершения. Это означает, что предыдущий пример можно записать следующим образом:

    Этот текст будет {\bfseries жирным}. А этот нет.

Окружения
=========

Окружения представляют собой команды, действующие на большие объемы текста. Окружения, как и переключающие команды, имеют команду включения и отключения:
1. `\begin{<имя>}` - команда включения окружения с данным "именем";
1. `\end{<имя>}` - команда отключения окружения с данным "именем".

Ниже приведен пример окружения, центрирующего свое содержимое посередине листа:

    \begin{center}
      Этот текст будет расположен по центру листа.
    \end{center}
    А этот нет.

Параметры
=========

Некоторые команды в LaTeX, а так же сам компилятор меняют свое поведение в зависимости от параметров. Параметры задаются следующим образом:

    \<имя>=<значение>

Часто в качестве "значения" параметра указываются длины. Ниже приведены возможные измерения длин:

    pt ≈ 0.35
    pc = 12 pt
    mm - миллиметр
    cm = 10 mm
    in = 25,4 mm
    dd - пункт Дидо ≈ 1,07 pt
    cc = 12 dd
