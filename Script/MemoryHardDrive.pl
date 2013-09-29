#!/usr/bin/perl
use Time::localtime;
$tm = localtime;
=head
*  Developer Name: Zakeria Hassan <zak.hassan1010@gmail.com>
*  Date: June 27 2013
*  Purpose: Maintaining the resource memory utilization, and harddrive space.
*  Usage: Use it and log all messages to a log file for further analysis.
=cut
        my $mLimit=1000;   # Memory limit
        my $hLimit=80;	   # Harddrive space limit
        my $memory=`free -m | head -n 2| tail -n 1|awk '{print \$3}'`;
        my $perstorage=`df -h -l /dev/xvda1 |tail -n +2 | awk '{print \$5}'`;

        if($memory <$mLimit){
                printf("%s \t Warning Memory Low! Memory Remaining: %s", ctime(),$memory);
        }else{  
                printf("%s \t Memory Remaining: %s", ctime(),$memory);
        }
                $perstorage=substr($perstorage,0,-2);
        if($perstorage < $hLimit){
                printf("%s \t Storage Remaining: %s", ctime(),$perstorage);
        } else {
                printf("%s \t Warning Hard Drive Space too low! Storage Remaining: %s", ctime(),$perstorage);
        }
        print "\n";


