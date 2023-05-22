# Microsoft Developer Studio Generated NMAKE File, Format Version 4.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=open_file - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to open_file - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "open_file - Win32 Release" && "$(CFG)" !=\
 "open_file - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "open_file.mak" CFG="open_file - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "open_file - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "open_file - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
# PROP Target_Last_Scanned "open_file - Win32 Debug"
F90=fl32.exe
RSC=rc.exe

!IF  "$(CFG)" == "open_file - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
OUTDIR=.
INTDIR=.

ALL : "$(OUTDIR)\open_file.exe"

CLEAN : 
	-@erase ".\open_file.exe"
	-@erase ".\open_file.obj"
	-@erase ".\FATT_MAX_VALUES.OBJ"

# ADD BASE F90 /Ox /c /nologo
# ADD F90 /Ox /c /nologo
F90_PROJ=/Ox /c /nologo 
# ADD BASE RSC /l 0x410 /d "NDEBUG"
# ADD RSC /l 0x410 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/open_file.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/open_file.pdb" /machine:I386 /out:"$(OUTDIR)/open_file.exe" 
LINK32_OBJS= \
	"$(INTDIR)/open_file.obj" \
	"$(INTDIR)/FATT_MAX_VALUES.OBJ"

"$(OUTDIR)\open_file.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "open_file - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
OUTDIR=.
INTDIR=.

ALL : "$(OUTDIR)\open_file.exe"

CLEAN : 
	-@erase ".\open_file.exe"
	-@erase ".\open_file.obj"
	-@erase ".\FATT_MAX_VALUES.OBJ"
	-@erase ".\open_file.ilk"
	-@erase ".\open_file.pdb"

# ADD BASE F90 /Zi /c /nologo
# ADD F90 /Zi /c /nologo
F90_PROJ=/Zi /c /nologo /Fd"open_file.pdb" 
# ADD BASE RSC /l 0x410 /d "_DEBUG"
# ADD RSC /l 0x410 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/open_file.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/open_file.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/open_file.exe" 
LINK32_OBJS= \
	"$(INTDIR)/open_file.obj" \
	"$(INTDIR)/FATT_MAX_VALUES.OBJ"

"$(OUTDIR)\open_file.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.for.obj:
   $(F90) $(F90_PROJ) $<  

.f.obj:
   $(F90) $(F90_PROJ) $<  

.f90.obj:
   $(F90) $(F90_PROJ) $<  

################################################################################
# Begin Target

# Name "open_file - Win32 Release"
# Name "open_file - Win32 Debug"

!IF  "$(CFG)" == "open_file - Win32 Release"

!ELSEIF  "$(CFG)" == "open_file - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\open_file.f

"$(INTDIR)\open_file.obj" : $(SOURCE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=\
"\Users\dadro\Documents\GitHub\Esercizi_Calcolo_Numerico\Gruppo 1\2_FATTORIALE\FATT_MAX_VALUES.F"

"$(INTDIR)\FATT_MAX_VALUES.OBJ" : $(SOURCE) "$(INTDIR)"
   $(F90) $(F90_PROJ) $(SOURCE)


# End Source File
# End Target
# End Project
################################################################################
