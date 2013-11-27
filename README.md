MyMCatNLO
=========
Felix Hoehle
=========
MCatNLO adapted to run in CMSSW
it was tested using slc5_amd64_gcc434 and CMSSW_4_4_2_patch6

source http://www.hep.phy.cam.ac.uk/theory/webber/MCatNLO/Package341.tar.gz 
a backup copy is in commit adab9184e10718ab04c0f90cb4574e139072bb47 of this package

usage: 	download with git in an existing cmssw environment
	execute ./install.sh
	source setup.sh

	create a new MCatNLO job with newMCatNLO_job.sh myJob
	cd myJob ; adapt MCatnlo.inputs and run it

