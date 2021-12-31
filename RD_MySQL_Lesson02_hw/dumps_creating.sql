SELECT "Дамп базы данных example :
anon3131@anon3131-VirtualBox:~$ mysqldump example < exampledump.sql

Развертывание дампа exampledump.sql в новую базу данных sample :
anon3131@anon3131-VirtualBox:~$ mysql sample < exampledump.sql

Дамп первых 100 строк таблицы help_keyword базы данных mysql :
anon3131@anon3131-VirtualBox:~$ mysqldump --opt --where='1 limit 100' mysql help_keyword > 100firstrows-help_keyword-mysqldump.sql