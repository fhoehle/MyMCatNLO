#!/bin/bash
mainDir=$PWD
installDir=$mainDir/MCatNLO_3_4_1_Base
tarBallDir=$mainDir/mcatnlo_341_tarBall
if [ "X$1" == "X" ]; then
mkdir $tarBallDir
  cd $tarBallDir
  wget http://www.hep.phy.cam.ac.uk/theory/webber/MCatNLO/Package341.tar.gz
  mkdir $installDir
  cd $installDir
  tar -xzf $tarBallDir/Package341.tar.gz
  mv Package341/* ./
  rm -rf Package341 
  #patch < $mainDir/cmsswMCatNLO_4_1_0.patch
  #chmod u+x MCatNLO.inputs
  #chmod -R a-w $installDir
else if [ "X$1" == "Xclean" ]; then
  rm -rf $tarBallDir
  rm -rf $installDir
else
echo "option $1 not supported"
  exit 1
fi
fi 
