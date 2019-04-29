#!/bin/bash
# Declare Device  
device=cedric
brand=motorola

#This is dependent on weather you use lineage device trees will not work with 
echo "Installing figlet"
sudo apt-get install figlet -y

figlet Welcome To InfixRemix's Script's

echo "Make sure you are executing in rom directory with all the repos"

echo "What is rom are you building this is for .mk files so see what is required:"
read rom

echo "Checking build enviourment... Please make sure you have java 8 installed for pie!"
sudo apt-get update
sudo apt-get install bison g++-multilib git gperf libxml2-utils make zlib1g-dev:i386 zip liblz4-tool libncurses5

echo "One mistake could cost it all read everything carefully, it will not work correctly"

echo "cloning cedric dependencies"
git clone https://github.com/Sohamlad7/android_vendor_motorola_cedric vendor/motorola/cedric
git clone https://github.com/Sohamlad7/android_device_motorola_cedric device/motorola/cedric

mkdir kernel
git clone https://github.com/Sohamlad7/android_kernel_motorola_msm8937 kernel/motorola/msm8937

devicedir=device/$brand/$device

#Cd to directory of device
cd $devicedir

mv lineage_$device".mk" $rom"_"$device".mk"
newmk= $rom"_"$device".mk"

#Renaming mks and rom stuff

sed -i -e 's/lineage/'$rom/g $newmk
sed -i -e 's/lineage/'$rom/g vendorsetup.sh
sed -i -e 's/lineage/'$rom/g AndroidProducts.mk
cd "$OLDPWD"

. build/envsetup.sh
lunch $rom"_"$device

mka bacon -j$(nproc --all)
