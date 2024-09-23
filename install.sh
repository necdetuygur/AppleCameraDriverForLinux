sudo apt update
sudo apt install curl git unrar unzip gcc-12 -y

curl -L -o "bootcamp5.1.5769.zip" -C - "https://download.info.apple.com/Mac_OS_X/031-30890-20150812-ea191174-4130-11e5-a125-930911ba098f/bootcamp5.1.5769.zip"

git clone https://github.com/patjak/facetimehd-firmware.git
cd facetimehd-firmware
make
sudo make install

cd ..

unzip bootcamp5.1.5769.zip
cd BootCamp/Drivers/Apple/
unrar x AppleCamera64.exe

dd bs=1 skip=1663920 count=33060 if=AppleCamera.sys of=9112_01XX.dat
dd bs=1 skip=1644880 count=19040 if=AppleCamera.sys of=1771_01XX.dat
dd bs=1 skip=1606800 count=19040 if=AppleCamera.sys of=1871_01XX.dat
dd bs=1 skip=1625840 count=19040 if=AppleCamera.sys of=1874_01XX.dat

sudo cp *.dat /usr/lib/firmware/facetimehd

cd ..
cd ..
cd ..

git clone https://github.com/patjak/bcwc_pcie.git
cd bcwc_pcie
make
sudo make install

sudo depmod
sudo modprobe -r bdc_pci
sudo modprobe facetimehd
echo facetimehd | sudo tee -a /etc/modules > /dev/null

cd ..

echo ""
echo ""
echo ""
echo "Visit: https://tr.webcamtests.com"
