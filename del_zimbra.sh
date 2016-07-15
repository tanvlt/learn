#
##List user mail####
##acct=`zmprov -l gaa| grep tan`;

acct=`cat /tmp/tanvl`
for acct in ${acct}
do

##Get mail ID ########
for msg in $(zmmailbox -z -m ${acct} s -l 7 -t message "From: networker@vietabank.com.vn Subject: REDMINE" | awk '{ print $2 }' | tail -n +6) ;
do
echo "Delete mail ID "$msg" from "$acct"";
##Delete email
zmmailbox -z -m "${acct}" dm "${msg}";
done
done
