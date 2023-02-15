tardir=/scratch/csng/YEL/data/raw
indir=/groups/YEL/PM2_preprocessed/raw

mapfile -t sublist < "/home/mkisner/move-participants.tsv"

for sub in "${!sublist[@]}";
    do
    echo ${sublist[sub]}
   cp -R $indir/sub-${sublist[sub]} $tardir
   echo raw data copied to scratch! get to preprocessing!

done

