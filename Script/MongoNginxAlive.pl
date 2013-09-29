#!/usr/bin/perl
use Time::localtime;
$tm = localtime;
=head
*  Developer Name: Zakeria Hassan <zak.hassan1010@gmail.com>
*  Date: June 27 2013
*  Purpose: To make sure nginx is on and stays on if its died
*  Usage: Use it and log all messages to a log file for further analysis.
=cut
my $nginx=`ps -ef | grep -v grep | grep 'nginx' | wc -l`;
my $mongod=`ps -ef | grep -v grep | grep 'mongod' | wc -l`;

#Checking nginx
if($nginx > 0){
	printf("%s \t nginx is on \n", ctime());
}else{
	printf("%s \t nginx is off\tStarting nginx\n",ctime());
my $s=`service nginx start`;
	printf("%s \t Status:%s \n", ctime(),$s);
}

#Checking mongodb
if($mongod >0){
        printf("%s \t mongod is on\n", ctime());
} else {
        printf("%s \t mongod is off.\tStarting mongod\n",ctime());
        my $sp=exec("mongod &");
        printf("%s \t Status:%s \n", ctime(),$sp);
}
