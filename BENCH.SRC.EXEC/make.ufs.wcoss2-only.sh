cd ufs_model.fd
cd modulefiles ; module use `/bin/pwd` ;  module load  ufs_wcoss2.intel.lua
cd ..
rm -rf build
mkdir build
cd build

cmake ..  -DAPP=S2SW -D32BIT=ON -DCCPP_SUITES=FV3_GFS_v17_p8_ugwpv1,FV3_GFS_v17_coupled_p8_ugwpv1,FV3_global_nest_v1 -DPDLIB=ON -DCMAKE_BUILD_TYPE=Release -DMPI=ON
make -j 8 VERBOSE=1
mkdir ../exec
cp ufs_model ../exec/ufs_model.x
