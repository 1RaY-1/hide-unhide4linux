#!/usr/bin/bash -e

#####
# A simple bash script to hide files or directories by just adding a dot in the beginning of that file or directory
#####

target=""
status=0

_help(){
    echo "
Usage: $0 FILE_OR_DIRECTORY_TO_HIDE

Hide files or directories by just adding a dot in the beginning of that file or directory.

Exit status:
 0  if OK,
 1  if minor problems.
"
}

check_target(){
#   check if needed file or directory exists
    if ! [ -f ${target} ] && ! [ -d ${target} ]; then
        echo "$0: --> '${target}' No such file or directory"
        return 1
    else
        return 0
    fi
}

hide(){
    if [[ ${target} == */* ]] || [[ ${target} == *//* ]] && [[ ${target: -1} != "/" ]]; then
        _target=$target
        temp=${target%/*}/
        target=${target##*/}

#       check if needed file/dir is already not hidden
        if [[ ${target:0:1} == "." ]]; then status=0
        else
            mv ${_target} ${temp}.${target##*/} >>/dev/null 2>&1
            status=$?
        fi
        
    else
        if [[ ${target:0:1} == "." ]]; then status=0
        else
            mv ${target} .${target} >>/dev/null 2>&1
            status=$?
        fi
    fi
}

# START
if [ "$#" -eq 0 ]; then
    _help
    exit 1

else 
    i=1
    for i in ${@:1}; do
        target=$i
        check_target
        if [[ $? -eq 0 ]];then hide
        else status=$?
        fi
    done
fi

# FINISH
exit $status
