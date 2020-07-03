#!/bin/bash
wget https://github.com/FOGProject/fogproject/archive/master.tar.gz
tar -zxvf master.tar.gz
file="fogproject-master/lib/common/functions.sh"
sed -i "s/downloadfiles()/downloadfiles2()/g" $file
cat downloadfiles.sh >> $file
cd fogproject-master/bin
./installfog.sh
