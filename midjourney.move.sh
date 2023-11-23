#!/bin/bash

######################################################################
# Zip Files Folder *WARNING, all files in this folder will be deleted*
ZIP_FOLDER="/home/$USER/midjourney/Zip.Files/"
######################################################################
# Midjourney pics folder
MIDJOURNEY_FOLDER="/home/$USER/midjourney/"
######################################################################

mkdir -p $MIDJOURNEY_FOLDER
mkdir -p $ZIP_FOLDER

cd $ZIP_FOLDER

echo -e "\nUnzipping Files..."
sleep 2
unzip \*.zip

echo -e "\nCreating new folder for files..."
sleep 2
mkdir ${MIDJOURNEY_FOLDER}midjourney-$(date +%Y-%m-%d_%H%M%S)

cd $MIDJOURNEY_FOLDER

MOVE=$(ls -td -- */ | head -n 1)
echo -e "\n${MOVE} folder Created"
sleep 2

cd $MOVE

echo -e "\nMoving Midjourney Files..."
sleep 2
find . -name '*.png' -exec cp {} $MOVE \;

echo -ne "
    Do you want to delete all files and folders in the $ZIP_FOLDER directory?
    1) Yes
    2) No
    0) Exit
    'Choose an option:') "
        
        read A
            
        case $A in
        1) 
        cd $ZIP_FOLDER ;
        echo -e "\nRemoving all unwanted files and folders..." ; 
        sleep 2 ; 
        rm -rf * ;;

	      2) 
	      echo -e "\n The files and folders have not been deleted" ;;
	     
        0) 
        exit 0 ;;
        
        *) 
        echo -e "Wrong option" ;;
    esac
