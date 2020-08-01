#!/bin/bash


DIR="/eos/cms/store/cmst3/user/gkaratha/cmgTuple_PFeKEE_11B_v4.2_noBDTPresel/"

Nexp=11; #need expected+1 

DeleteTempFiles=true  #those having BParkNANO_data_*.root

for i in "$DIR"/*
do
   if [[ -f $i ]]; then
     continue
   fi
   RES=$(ls -lh $i | wc -l)
#   echo $i,$RES
   if [[ $RES -ne $Nexp ]]
   then
     echo $RES, $Nexp
     echo "problem on $i"
     ls $i
     if [ "$DeleteTempFiles" = true ]; then
        echo "Deleting files BParkNANO_data_*.root"
        rm $i/BParkNANO_data_*.root
     fi
   fi
done
echo "it is expected for small parts to have fewer chunks (eg 2018YpartX_0001 where Y=A,B X=1-6). Of course the chunks should still be in correct order and just finish to smaller number (eg 7 instead of 9)"
