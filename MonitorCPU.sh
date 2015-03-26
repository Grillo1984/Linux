##########################
# 			 #
# 			 #
#Monitoraggio Risorse PC #
#CPU > 50%		 #
#			 #
##########################


d=$(date +"%d%m%Y_%H:%M:%S")
touch cpu_$d.log

for (( i = 0; i <= 5; i++ ))
do
top -b -d1 -n1 | gawk 'BEGIN{found="no";}{if ($1!= "PID" && found=="no") next; found="si"; if ($9 > 50.0) { print strftime("%Y-%m-%d %H:%M:%S") " pid = " $1 " proc = " $12 " cpu = " $9;}}' >> cpu_$d.log
done
