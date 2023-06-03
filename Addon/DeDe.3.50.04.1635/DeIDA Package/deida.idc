/* ******************************************************************** **
** @@ DeIDA.IDC
** @  Copyrt : Aleph
** @  Author : Aleph
** @  Modify :
** @  Update : 09 Jul 2002
** @  Notes  : Simple script to "import" DDM map file to IDA database
** ******************************************************************** */

//    BTW, you can save all lines appearing in the messages window to a file.
//    Just set an enviroment variable:
//
//          set IDALOG=ida.log
//
//    I always have this variable set, it is great help in the development.
//
//    Copyright (c) by Ilfak Guilfanov.

//////////////////////////////////////////////////////////////////////////
static GetAddress16(Text)
{
   auto  LL;
   auto  Base;
   auto  Ofs;

   LL= substr(Text,1,12);

   Base = substr(LL,0,strstr(LL,":"));
   Ofs  = substr(LL,strstr(LL,":") + 1,-1);
//   Message("GetAddress16() Base:%s Ofs:%s %08x  %08x  %08x\n", Base, Ofs, SegByName(Base), xtol(Ofs), SegByName(Base) + Ofs);

   return (SegByName(Base) + xtol(Ofs));
}

//////////////////////////////////////////////////////////////////////////
static GetAddress32(Line)
{
   return xtol(substr(Line,1,9));
}

//////////////////////////////////////////////////////////////////////////
static GetFlag(Line)
{
   return substr(Line,17,18);
}

//////////////////////////////////////////////////////////////////////////
static GetText(Line)
{
   auto  LL;

   LL = substr(Line,19,-1);
   LL = substr(LL,0,strstr(LL,"\n"));

   return LL;
}

//////////////////////////////////////////////////////////////////////////
static GetName(Text)
{
   auto  TT;

   TT = substr(Text,0,strstr(Text," "));
   TT = substr(TT,0,strstr(TT,"("));

   return TT;
}

//////////////////////////////////////////////////////////////////////////
static main(void)
{
   auto     File;
   auto     Handle;
   auto     Line;
   auto     Adr16;
   auto     Adr32;
   auto     Flag;
   auto     Text;
   auto     Name;

   File = AskFile(Handle,"MapFile.DDM","*.DDM");

   Handle = fopen(File,"rt");

   if (Handle == 0)
   {
      Warning("Error open input file %s",File);
      return;
   }

   Message("Proceed Input File: %s\n",File);

   while (1)
   {
      Line = readstr(Handle);

      if (Line == -1)
         break;

      // Parse String
      Adr16 = GetAddress16(Line);
      Adr32 = GetAddress32(Line);
      Flag  = GetFlag(Line);
      Text  = GetText(Line);
      Name  = GetName(Text);

      if (Flag == "<")
      {
         if (MakeName(Adr32,Name) != 1)
            Message("Err: MakeName() at adr %08X - %s\n",Adr32,Name);
         else
            Message("Renamed at adr %08X - %s\n",Adr32,Name);

         if (MakeComm(Adr32,Text) != 1)
            Message("Err: MakeComm() at adr %08X - %s\n",Adr32,Text);
         else
            Message("Commented at adr %08X - %s\n",Adr32,Text);

         continue;
      }

      if (Flag == "+")
      {
         if (MakeName(Adr16,Name) != 1)
            Message("Err: MakeName() at adr %08X - %s\n",Adr16,Name);
         else
            Message("Renamed at adr %08X - %s\n",Adr16,Name);

         if (MakeComm(Adr16,Text) != 1)
            Message("Err: MakeComm() at adr %08X - %s\n",Adr16,Text);
         else
            Message("Commented at adr %08X - %s\n",Adr16,Text);

         continue;
      }

      if (Flag == "!")
      {
         if (substr(GetFunctionName(Adr32),0,4) != "sub_")
            continue;

         if (MakeName(Adr32,Name) != 1)
            Message("Err: MakeName() at adr %08X - %s\n",Adr32,Name);
         else
            Message("Renamed at adr %08X - %s\n",Adr32,Name);

         if (MakeComm(Adr32,Text) != 1)
            Message("Err: MakeComm() at adr %08X - %s\n",Adr32,Text);
         else
            Message("Commented at adr %08X - %s\n",Adr32,Text);

         continue;
      }

      if (Flag == "*")
      {
         if (MakeComm(Adr32,Text) != 1)
            Message("Err: MakeComm() at adr %08X - %s\n",Adr32,Text);
         else
            Message("Commented at adr %08X - %s\n",Adr32,Text);

         continue;
      }

      if (Flag == ">")
      {
         if (MakeComm(Adr32,Text) != 1)
            Message("Err: MakeComm() at adr %08X - %s\n",Adr32,Text);
         else
            Message("Commented at adr %08X - %s\n",Adr32,Text);

         continue;
      }

      if (Flag == ":")
      {
         if (MakeComm(Adr32,Text) != 1)
            Message("Err: MakeComm() at adr %08X - %s\n",Adr32,Text);
         else
            Message("Commented at adr %08X - %s\n",Adr32,Text);

         continue;
      }
   }

   fclose(Handle);

   Warning("Done");
}

/* ******************************************************************** **
**                End of File
** ******************************************************************** */
