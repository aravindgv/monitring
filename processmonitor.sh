#!/bin/bash
## Add your email id
_email="your@mobile.email.id.example.com"
check_mysql()
{
 if [[ `ps -ef | grep mysqld | grep -v mysqld_safe | grep -cv grep` -ne 1 ]] && [[ `ps -ef | grep mysqld_safe | grep -cv grep` -ne 1 ]]; then
 echo "Mysql on `hostname` is DOWN!! - `date`" | /bin/mail "${_email}" -s "ERROR: `hostname` - MySQL for is DOWN!!" 
 fi
}
check_tomcat()
{
 if [ `ps -ef | grep java | grep -i "org.apache.catalina.startup.Bootstrap" | grep -cv grep` -ne 1 ]; then
 echo "Tomcat on `hostname` is DOWN!! - `date`" | /bin/mail "${_email}" -s "Tomcat Down on - `hostname`" 
 fi
}
check_apache()
{
 if [ `ps -ef | grep httpd | grep root | grep -cv grep` -ne 1 ]; then
 echo "Apache on - `hostname` is DOWN!! - `date`" | /bin/mail "${_email}" -s "ERROR: `hostname` - Apache on is DOWN!!" 
 fi
}
## Calling the functions
check_mysql
check_tomcat
check_apache
