#!/usr/bin/bash -e

file1=hide.sh
file2=unhide.sh
new_file1=0
new_file2=0
dest_dir=0

if ! [ -f $file1 ] || ! [ -f $file2 ]; then
    echo "Sorry, missing needed files: $file1 $file2"
    exit 1
fi

printf "Checking for needed directory...\n\n"

if [ -d /data/data/com.termux/files/usr/bin/ ]; then
    _sudo=""
    dest_dir=/data/data/com.termux/files/usr/bin

else

    if [ -d $HOME/bin/ ]; then
        dest_dir=$HOME/bin
        _sudo=""

    elif [ -d /usr/bin/ ]; then
        dest_dir=/usr/bin
        _sudo="sudo"

    elif [ -d /usr/local/bin/ ]; then
        dest_dir=/usr/local/bin
        _sudo="sudo"

    elif [ -d /bin/ ]; then
        dest_dir=/bin
        _sudo="sudo"

    else 
        echo "Sorry, I don't know what to do."
        exit 1
    fi
fi

_install (){
    new_file1=${file1%.*}
    echo "Renaming '${file1}' to '${new_file1}' ..."
    mv $file1 $new_file1

    new_file2=${file2%.*}
    echo "Renaming '${file2}' to '${new_file2}' ..."
    mv $file2 $new_file2

    echo "Moving: '$new_file1', '$new_file2' to '$dest_dir' ..."
    $_sudo mv -t $dest_dir $new_file1 $new_file2

    echo "Making '$dest_dir/$new_file1' and '$dest_dir/$new_file2' executable ..."
    $_sudo chmod +x $dest_dir/$new_file1
    $_sudo chmod +x $dest_dir/$new_file2

    unset file1 file2 _sudo dest_dir
}

_check (){

    if [ `command -v $new_file1` ] && [ `command -v $new_file2` ]; then
        echo -e "\nDone!\nNow you can type '$new_file1' or '$new_file2' (and target file or directory) in your terminal."
        return 0
    else
        echo "Sorry, there has been an error."
        return 1
    fi
}

_remove_rest (){
    dir=$(pwd)
    cd ..
    rm -rf $dir
    return 0
}

# INSTALL
_install
_check
if [ $? -eq 0 ]; then _remove_rest
fi

# FINISH
exit