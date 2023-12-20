#!/bin/bash

function mjm () {
    ##############################################################################
    # Zip Files Folder *WARNING, all files in this folder will be deleted*
    zip_folder="/home/$USER/midjourney/Zip.Files/"
    ##############################################################################
    # Midjourney pics folder
    midjourney_folder="/home/$USER/midjourney/"
    ##############################################################################

    mkdir -p $midjourney_folder
    mkdir -p $zip_folder

    cd $zip_folder

    echo -e "\nUnzipping Files..."
    sleep 2
    unzip \*.zip

    echo -e "\nCreating new folder for files..."
    sleep 2
    mkdir ${midjourney_folder}midjourney-$(date +%Y-%m-%d_%H%M%S)

    cd $midjourney_folder

    move=$(ls -td -- */ | head -n 1)
    echo -e "\n${move} folder Created"
    sleep 2

    cd $zip_folder

    echo -e "\nMoving Midjourney Files..."
    sleep 2
    find . -name '*.png' -exec cp {} ${midjourney_folder}${move} \;

    echo -ne "
        Do you want to delete all files and folders in the $zip_folder directory?
        1) Yes
        2) No
        0) Exit
        'Choose an option:') "
            
            read A
                
            case $A in
            1) 
            cd $zip_folder ;
            echo -e "\nRemoving all unwanted files and folders..." ; 
            sleep 2 ; 
            rm -rf * ;
            cd ~ ;;

            2) 
            echo -e "\n The files and folders have not been deleted" ;;
            
            0) 
            exit 0 ;;
            
            *) 
            echo -e "Wrong option" ;;
        esac
}
