#!/bin/bash

#This is dependent on weather you use lineage device trees will not work with 
echo "Installing figlet"
sudo apt-get install figlet -y

figlet Welcome To InfixRemix's Script's

echo "One mistake could cost it all read everything carefully, it will not work correctly"

echo "What is Your Device code name ?(Cedric, montana , bacon):"
read device

echo "What is Your Device Brand ?(motorola, it refers to the path so device/motorola/<codename>):"
read brand
devicedir=device/$brand/$device

echo "What is rom are you building this is for .mk files so see what is required:"
read rom

cd $devicedir
mv lineage_$device".mk" $rom"_"$device".mk"
newmk= $rom"_"$device".mk"

sed -i -e 's/lineage/'$rom/g $newmk
sed -i -e 's/lineage/'$rom/g vendorsetup.sh
sed -i -e 's/lineage/'$rom/g AndroidProducts.mk
cd "$OLDPWD"

. build/envsetup.sh
lunch $rom"_"$device

mka bacon -j$(nproc --all)
