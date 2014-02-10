Check The Process Of Memory Usage

We often encounter the process crashes caused by high memory usage and cause service interruptions. Memory usage is too high may be lead to a memory leak. Through the GetCheckMem.sh script, we can monitor the memory usage of the speicified process in real-time , it also can notify the user when the memory usage is abnormal. It has one parameter as process ID, it first uses the PS to check process information, and through grep -v to filter out the VSZ line.

[root@aravind ~]# ./GetCheckMem.sh 3920
 The usage of memory is normal
