autodie - автоматическое завершение скрипта при ошибке в системном вызове
Прагма autodie
==============

Прагма autodie позволяет автоматически завершать работу Perl программы в случае появления ошибки системного вызова. На пример, при неудачном открытии файла функцией `open` Perl скрипт завершит свою работу.

Прагма используется следующим образом:

    use autodie(<категория>, ...);

Различаются следующие категории:

* :all
** :default
*** :io
**** read
**** seek
**** sysread
**** sysseek
**** syswrite
**** :dbm
***** dbmclose
***** dbmopen
**** :file
***** binmode
***** close
***** fcntl
***** fileno
***** flock
***** ioctl
***** open
***** sysopen
***** truncate
**** :filesys
***** chdir
***** closedir
***** opendir
***** link
***** mkdir
***** readlink
***** rename
***** rmdir
***** symlink
***** unlink
**** :ipc
***** ipe
***** :msg
****** msgctl
****** msgget
****** msgrcv
****** msgsnd
***** :semaphore
****** semctl
****** semget
****** semop
***** :shm
****** shmctl
****** shmget
****** shmread
**** :socket
***** accept
***** bind
***** connect
***** getsockopt
***** listen
***** recv
***** send
***** setsockopt
***** shutdown
***** socketpair
*** :threads
**** fork
** :system
*** system
*** exec
