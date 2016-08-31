#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/zimbra/bin/
#Xoa toan bo Email trong cac mail box  ######3
##List user mail####
##acct=`zmprov -l gaa| grep tan`;
today=`date '+%Y%m%d_%H:%M'`;
###Del mail from Sat lastweek to Fri ########
before_date=`date '+%m/%d/%y'`;
after_date=`date '+%m/%d/%y' -d "-8 days"`;

acct=`cat /opt/del_mail/user`
for acct in ${acct}
do

##Get mail ID ########
for msg in $(zmmailbox -z -m ${acct} s  -t message -l 1000 "after: $after_date before: $before_date" | tee -a /opt/del_mail/log/list__$today.log | awk '{ print $2 }' | tail -n +5) ;
do
echo "Delete mail ID "$msg" from "$acct"" | tee -a /opt/del_mail/log/prossec_$today.log;
##Delete email
zmmailbox -z -m "${acct}" dm "${msg}";
done
done
