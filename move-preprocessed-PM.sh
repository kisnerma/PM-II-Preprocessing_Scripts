tardir=/groups/YEL/PM2_preprocessed
indir=/scratch/csng/YEL/data

mapfile -t sublist < "/home/mkisner/move-participants.tsv"

for sub in "${!sublist[@]}";
    do
    echo ${sublist[sub]}
   cp -R /scratch/csng/YEL/data/output/fmriprep/sub-${sublist[sub]} /groups/YEL/PM2_preprocessed/fmriprep/
   echo fmriprep copied successfully!
   cp -R /scratch/csng/YEL/data/output/freesurfer/sub-${sublist[sub]} /groups/YEL/PM2_preprocessed/freesurfer/
   echo freesurfer copied successfully!
   cp -R /scratch/csng/YEL/data/output/stats/sub-${sublist[sub]} /groups/YEL/PM2_preprocessed/stats/
   echo stats copied succesfully!   
   cp -R /scratch/csng/YEL/data/TextFiles/${sublist[sub]} /groups/YEL/PM2_preprocessed/TextFiles/ 
   echo TextFiles copied successfully!
   cp -rf /scratch/csng/YEL/data/output/fmriprep/sub-${sublist[sub]}/func/*confounds_reduced.tsv /groups/YEL/PAIT2_preprocessed/fmriprep/sub-${sublist[sub]}/func/  
   echo confounds copied successfully! 
    done


