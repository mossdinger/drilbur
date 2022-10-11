#! /bin/bash

if ! command -v unrar 1>/dev/null;
then
    echo "DEPENDENCY REQUIRED: unrar not installed"
    echo "If you are using linux distro with apt package manager. Try: sudo apt install unrar"
    exit 1
fi

for i in {0..9999}
do
    percentage=$(echo "scale=4;i=$i;remain=10000-i;remain_per=remain/100;remain_per" | bc -l)
    echo "Drilling.... Drill duratbility: $percentage%"
    echo Trying: $i
    if (unrar x $1 -p$i -opextract_site 1>/dev/null 2>/dev/null)
    then
        echo Succesful
        echo password is $i
        echo Extracted files can be found in extraction_site
        break
    fi
    clear
done