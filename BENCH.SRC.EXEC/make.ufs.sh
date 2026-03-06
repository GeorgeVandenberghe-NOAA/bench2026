cd DEPENDENCIES
cp build/setupa setup.dependencies
cd ../ufs_model.fd
source ../DEPENDENCIES/setup.dependencies
sh -x make.ufs.sh

