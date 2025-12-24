#!/system/bin/sh


red='\033[1;31m'
green='\033[1;32m'
nd='\033[0m'

clear

echo -e "${red}██╗     ██╗ ██████╗ ██╗  ██╗████████╗███╗   ██╗██╗███╗   ██╗ ██████╗ 
██║     ██║██╔════╝ ██║  ██║╚══██╔══╝████╗  ██║██║████╗  ██║██╔════╝ 
██║     ██║██║  ███╗███████║   ██║   ██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
██║     ██║██║   ██║██╔══██║   ██║   ██║╚██╗██║██║██║╚██╗██║██║   ██║
███████╗██║╚██████╔╝██║  ██║   ██║   ██║ ╚████║██║██║ ╚████║╚██████╔╝
╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
                    ⚡ LightningTracker ⚡"

echo

read -p "Enter IP target : " IP
echo
echo -e "${green}================== Information about $IP ==================${nd}"
echo
data=$(curl -s "https://ipwhois.app/json/$IP")


print() {
  tru=$1
  k=$2                                                                                                                                         value=$(echo "$data" | grep -o "\"$k\":\"[^\"]*\"" | head -n1 | cut -d':' -f2- | sed 's/[",]//g')
  if [ -n "$value" ]; then
    echo -e "${red}$tru${nd} : ${green}$value${nd}"
  fi
}


print "IP target" ip
print "Country" country
print "Country code" country_code                                                                                                            print "Continent" continent
print "Continent code" continent_code
print "City" city
print "Continent" continent
print "Calling Code" country_phone
print "ASN" asn
print "Timezone ID" timezone
print "Current Time" current_time
print "UTC" timezone_gmt
print "Offset" timezone_gmtoffset
print "ORG" org
print "EU" is_eu
print "currency" currency_code
print "Currency name" currency_plural


lat=$(echo "$data" | grep -o '"latitude":[^,]*' | cut -d':' -f2 | head -n1)
lon=$(echo "$data" | grep -o '"longitude":[^,]*' | cut -d':' -f2 | head -n1)
if [ -n "$lat" ] && [ -n "$lon" ]; then
  echo -e "${red}Maps${nd} : ${green}https://www.google.com/maps/@$lat,$lon,8z${nd}"
fi