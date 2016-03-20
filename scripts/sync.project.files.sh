#!/bin/bash
# project env
   SrcDir="/cygdrive/D/xampp/htdocs/pegasus"
#IgnoreDirs="$IgnoreDirs vendor"
IgnoreDirs="     vendor"
IgnoreDirs="$IgnoreDirs TODO"
   DstDir="/cygdrive/E/root/sync/sync/Career/DaiGouGuanJia/pegasus"

# format the <IgnoreDirs> for find cmd
IgnoreDirs=`echo $IgnoreDirs | sed 's/^[ \t]\+//g; s#[ \t]\+# -o -path */#g; s#^#*/#';`;

echo "------------------------------------------";
echo "SrcDir    :$SrcDir";
echo "IgnoreDirs:$IgnoreDirs";
echo "DstDir    :$DstDir";
echo "------------------------------------------";

# copy the <SrcDir> file excluded <IgnoreDirs> ones to <DstDir>
echo "sync project files from <$SrcDir>";
echo "                     to <$DstDir>...";
echo "#find $SrcDir/ -maxdepth 1 \( -path $IgnoreDirs \) -prune -o -print";
       find $SrcDir/ -maxdepth 1 \( -path $IgnoreDirs \) -prune -o -print | sed '1d' |
          xargs -I{} bash -c "
              echo 'copying {} ...';
              cp -r {} $DstDir
          ";
