#!/bin/bash
ToAddress="aravind.gv.gmail.com"
CCAddresses="agv@agv.com"
check_tomcat()
{
 if [ `ps -ef | grep java | grep -i "org.apache.catalina.startup.Bootstrap" | grep -cv grep` -ne 1 ]; then
 echo "BDTool on Host - `hostname` is DOWN!! - `date`" | /bin/mail "${ToAddress}" -s "ERROR: BDTool Down on - `hostname`" -c "${CCAddresses}"
 else
 echo "BDTool Tomcat - Good"
 fi
}
check_jetty()
{
 if [ `ps -ef | grep java | grep -i "jetty-6.1.14/start.jar" | grep -cv grep` -ne 1 ]; then
 echo "CT Workbench on Host - `hostname` is DOWN!! - `date`" | /bin/mail "${ToAddress}" -s "ERROR: `hostname` - CT Workbench DOWN!!" -c "${CCAddresses}"
 else
 echo "Jetty - Workbench - Good"
 fi
}
check_apache()
{
 if [ `ps -ef | grep httpd | grep root | grep -cv grep` -ne 1 ]; then
 echo "BDTool Apache on Host - `hostname` is DOWN!! - `date`" | /bin/mail "${ToAddress}" -s "ERROR: `hostname` - Apache on BDTool host is DOWN!!" -c "${CCAddresses}"
 else
 echo "BDTool Apache - Good"
 fi
}
check_mysql()
{
 if [[ `ps -ef | grep mysqld | grep -v mysqld_safe | grep -cv grep` -ne 1 ]] && [[ `ps -ef | grep mysqld_safe | grep -cv grep` -ne 1 ]]; then
 echo "BDTool MySQL on Host - `hostname` is DOWN!! - `date`" | /bin/mail "${ToAddress}" -s "ERROR: `hostname` - MySQL for BDTool host is DOWN!!" -c "${CCAddresses}"
 else
 echo "BDTool MySQL - Good"
 fi
}
## Calling the functions
check_tomcat
check_jetty
check_apache
check_mysql
