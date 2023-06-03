
DeDe is Excellent Delphi program analyzing tool, but I still prefer IDA for
navigation & documentation.

Exe-2-Dpr is another very useful utility (and also work with old 16-bit Delphi
programs).

I always look for way to grab as many info from this great program's output as
possible. So, I wrote a few stupid progs just to _reformate_ Exe2dpr & DeDe
output and import into IDA by simple IDC script.

That's all.

How to use:
-----------

EDM:

> -*-   EDM 1.4   *   Copyright (c) Aleph 2001-2003   -*-
> Exe-2-Dpr output files reformatter
> Usage: edm.com [> ProjectName.DDM]

Apply exe2dpr.exe to analyzed proggy. Place all exe2dpr output in some
directory. Now, run edm.com in this directory  and redirect edm output to some
file. edm will be scan all *.pas files in the directory and create output file
in *.ddm format. Use deida.idc script for import the *.ddm file to IDA database.


DDM

> -*-   DDM 1.2   *   Copyright (c) Aleph 2001,2002   -*-
> DeDe IDAMap Output file reformatter
> Usage: ddm.com DeDeIDAMapFile

Apply DeDe.exe to analyzed proggy. Go to 'Exports' tab. Create *.map file for
IDA. Now, apply ddm.com to the *.map file. *.ddm file with some name will be
created. Use deida.idc script for import the *.ddm file to IDA database.


EVT

> -*-   EVT 1.0   *   Copyright (c) Aleph 2002   -*-
> DeDe Events Output file reformatter > Usage: evt.com Events.txt

Apply DeDe.exe to analyzed proggy. Go to 'Project' tab and check all options.
Save the project in some directory. Now, apply evt.com to the events.txt file.
*.ddm file with some name will be created. Use deida.idc script for import the
*.ddm file to IDA database.


REF

> -*-   Ref 1.0   *   Copyright (c) Aleph 2003   -*-
> DeDe Project output files reformatter > Usage: ref.com [> ProjectName.DDM]

Apply DeDe.exe to analyzed proggy. Go to 'Project' tab and check all options.
directory. Save the project in some directory. Now, run ref.com in this
directory and redirect ref output to some file. ref will be scan all *.pas
files in the directory and create output file in *.ddm format. Use deida.idc
script for import the *.ddm file to IDA database.
