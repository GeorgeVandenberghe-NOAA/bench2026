source DEPENDENCIES/setup.dependencies
cd ufs_model.fd
export UROOT=`/bin/pwd`
rm -rf build
mkdir build
cd build
/bin/pwd
cmake ..  -DAPP=S2SW -D32BIT=ON -DCCPP_SUITES=FV3_GFS_v17_p8_ugwpv1,FV3_GFS_v17_coupled_p8_ugwpv1,FV3_global_nest_v1 -DPDLIB=ON -DCMAKE_BUILD_TYPE=Release -DMPI=ON
make -j 8 VERBOSE=1
if test -s ufs_model
then
mkdir ../../../exec
cp ufs_model ../../../exec/ufs_model.x
else
	sh ../bu.fix
	make -j 1 VERBOSE=1
	cp ufs_model ../../../exec/ufs_model.x
	echo needed ifort patch
fi
