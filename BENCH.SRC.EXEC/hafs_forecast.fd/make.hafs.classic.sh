source $HOME/.moda
source $HOME/setupa.classic
export UROOT=`/bin/pwd`
rm -rf build ; mkdir build ; cd build

cmake ../ -DAPP=HAFS-MOM6W -DREGIONAL_MOM6=ON -DCDEPS_INLINE=ON -DMOVING_NEST=ON -DFASTER=ON -DDEBUG=OFF -DCCPP_SUITES=FV3_HAFS_v2_coupled,FV3_HAFS_v2,FV3_HAFS_v1_thompson_nonsst,FV3_HAFS_v1_thompson,FV3_HAFS_v1_gfdlmp_tedmf_nonsst,FV3_HAFS_v1_gfdlmp_tedmf,FV3_HAFS_v1_gfdlmpv3_tedmf_nonsst,FV3_HAFS_v1_gfdlmpv3_tedmf,FV3_HAFS_v1_gfdlmpv3_noahmp_nonsst,FV3_HAFS_v1_gfdlmpv3_noahmp,FV3_HAFS_v1_thompson_noahmp_nonsst,FV3_HAFS_v1_thompson_noahmp,FV3_HAFS_v1_thompson_tiedtke,FV3_HAFS_v1_thompson_tiedtke_nonsst -D32BIT=ON -DRRTMGP_32BIT=ON -DMPI=ON -DCMAKE_BUILD_TYPE=Release
make -j 8
mkdir ../../exec
if test -s ufs_model
then
cp ufs_model ../../exec/hafs.x
else
        sh ../bu.fix
        make -j 1 VERBOSE=1
        cp ufs_model ../exec/ufs_model.x
        echo needed ifort patch
fi
cp ufs_model ../../exec/hafs.x
