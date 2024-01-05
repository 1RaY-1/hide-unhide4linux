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

printf "Checking for needed directory...\n\n";sleep 0.8

if [ -d /data/data/com.termux/files/usr/bin/ ]; then
    _sudo=""
    dest_dir=/data/data/com.termux/files/usr/bin

elif [ -d $HOME/bin/ ]; then
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


_install (){
    new_file1=${file1%.*} # <-- remove .sh
    echo "Renaming '${file1}' to '${new_file1}' ...";sleep 0.6
    mv $file1 $new_file1

    new_file2=${file2%.*}
    echo "Renaming '${file2}' to '${new_file2}' ...";sleep 0.6
    mv $file2 $new_file2

    # The commented code bellow doesn't work (dunno why), but it seems unnecessary
    #if [[ `command -v new_file1` ]] || [[ `command -v new_file2` ]] ; then 
    #    echo "Looks like '$new_file1' or '$new_file2' binaries already exist."
    #    exit 0
    #fi
    echo "Moving: '$new_file1', '$new_file2' to '$dest_dir' ...";sleep 0.8
    $_sudo mv -t $dest_dir $new_file1 $new_file2

    echo "Making '$dest_dir/$new_file1' and '$dest_dir/$new_file2' executable ...";sleep 0.8
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

# This function is to remove 'hide-unhide4linux' directory.
# And gonna disable the function as default
_remove_rest (){
    dir=$(pwd)
    cd ..
    rm -rf $dir
    return 0
}

# INSTALL
_install
_check
#if [ $? -eq 0 ]; then _remove_rest
#fi

# FINISH
exit
