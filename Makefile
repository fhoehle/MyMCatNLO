#F77= g77 -Wall -fno-automatic
#F77= gfortran -w -fno-automatic -fno-whole-file #  added to fix but failed
F77= gfortran -w -fno-automatic
CPP= g++ $(INCLOPTION)
SYSOBJ=trapfpe.o

DEBUG=
FF=$(F77) $(DEBUG)


%.o: %.f
	$(F77) $(DEBUG) $(AUTODBL) -c $<
%.o: %.for
	$(F77) $(DEBUG) $(AUTODBL) -c $<
%.o: %.cc
	$(CPP) $(DEBUG) -c $<
%.o: %.c
	$(CC) $(DEBUG) -c $^

VBFILES=mcatnlo_vbmain.o mcatnlo_vbxsec.o mcatnlo_helas2.o
QQFILES=mcatnlo_qqmain.o mcatnlo_qqxsec.o mcatnlo_helas2.o
HGFILES=mcatnlo_hgmain.o mcatnlo_hgxsec.o 
SBFILES=mcatnlo_sbmain.o mcatnlo_sbxsec.o
LLFILES=mcatnlo_llmain.o mcatnlo_llxsec.o
VHFILES=mcatnlo_vhmain.o mcatnlo_vhxsec.o
STFILES=mcatnlo_stmain.o mcatnlo_stxsec.o mcatnlo_helas2.o
WTDRFILES=mcatnlo_wtmain_dr.o mcatnlo_wtxsec_dr.o mcatnlo_helas2.o
WTDSFILES=mcatnlo_wtmain_ds.o mcatnlo_wtxsec_ds.o mcatnlo_helas2.o
LUTIFILES=mcatnlo_date.o mcatnlo_int.o mcatnlo_uxdate.o mcatnlo_uti.o \
         mcatnlo_str.o $(EXTRAOBJ)
LPDFFILES=mcatnlo_mlmtolha.o dummies.o 
HWFILES=mcatnlo_hwdriver.o mcatnlo_hwlhin.o \
        mcatnlo_str.o $(HWUTI)


QQNLO_EXE_LHAPDF : $(QQFILES) $(LUTIFILES) $(LPDFFILES) $(SYSOBJ)
	$(FF) $^ $(LHALIB) $(EXTRAPATHS) $(EXTRALIBS) -o $@

VVNLO_EXE_LHAPDF : $(VBFILES) $(LUTIFILES) $(LPDFFILES) $(SYSOBJ)
	$(FF) $^ $(LHALIB) $(EXTRAPATHS) $(EXTRALIBS) -o $@

HGNLO_EXE_LHAPDF : $(HGFILES) $(LUTIFILES) $(LPDFFILES) $(SYSOBJ)
	$(FF) $^ $(LHALIB) $(EXTRAPATHS) $(EXTRALIBS) -o $@

SBNLO_EXE_LHAPDF : $(SBFILES) $(LUTIFILES) $(LPDFFILES) $(SYSOBJ)
	$(FF) $^ $(LHALIB) $(EXTRAPATHS) $(EXTRALIBS) -o $@

LLNLO_EXE_LHAPDF : $(LLFILES) $(LUTIFILES) $(LPDFFILES) $(SYSOBJ)
	$(FF) $^ $(LHALIB) $(EXTRAPATHS) $(EXTRALIBS) -o $@

VHNLO_EXE_LHAPDF : $(VHFILES) $(LUTIFILES) $(LPDFFILES) $(SYSOBJ)
	$(FF) $^ $(LHALIB) $(EXTRAPATHS) $(EXTRALIBS) -o $@

STNLO_EXE_LHAPDF : $(STFILES) $(LUTIFILES) $(LPDFFILES) $(SYSOBJ)
	$(FF) $^ $(LHALIB) $(EXTRAPATHS) $(EXTRALIBS) -o $@

WTDRNLO_EXE_LHAPDF : $(WTDRFILES) $(LUTIFILES) $(LPDFFILES) $(SYSOBJ)
	$(FF) $^ $(LHALIB) $(EXTRAPATHS) $(EXTRALIBS) -o $@

WTDSNLO_EXE_LHAPDF : $(WTDSFILES) $(LUTIFILES) $(LPDFFILES) $(SYSOBJ)
	$(FF) $^ $(LHALIB) $(EXTRAPATHS) $(EXTRALIBS) -o $@

MC_EXE_LHAPDF : $(HWFILES) $(HERWIGVER) $(LPDFFILES)  
	$(FF) $^ $(LHALIB) $(EXTRAPATHS) $(EXTRALIBS) -o $@
