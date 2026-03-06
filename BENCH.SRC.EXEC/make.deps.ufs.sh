cd DEPENDENCIES
rm setup.dependencies
#make the dependencies
sh -x scr/make.fromdist.sh
cp build/setupa setup.dependencies
ls -l setup.dependencies
source ./setup.dependencies
read a
cd ../ufs_model.fd
sh -x make.ufs.sh
cd ..
sh -x  make.hafs.sh
