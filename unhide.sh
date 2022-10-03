#!/usr/bin/bash -e

#####
# A simple bash script to unhide files or directories by just removing a dot in the beginning of that file or directory
#####

target=""
status=0

_help(){
    echo "
Usage: $0 FILE_OR_DIRECTORY_TO_UNHIDE

Unhide files or directories by just removing a dot in the beginning of that file or directory.

Exit status:
 0  if OK,
 1  if minor problems.
"
}

check_target(){
#   check if needed file or directory exists
    if ! [ -f ${target} ] && ! [ -d ${target} ]; then
        # maybe user just entered hidden file/dir without a dot
        if [ -e ".${target}" ]; then
            target=".${target}" # <-- just correct
            return 0
        else 
            echo "$0: --> '${target}' No such file or directory"
            return 1
        fi

    else
        return 0
    fi
}

unhide(){
    if [[ ${target} == */* ]] || [[ ${target} == *//* ]] && [[ ${target: -1} != "/" ]]; then
        _target=$target
        temp=${target%/*}/
        target=${target##*/}

#       check if needed file/dir is already not hidden
        if [[ ${target:0:1} != "." ]]; then status=0
        else
            mv ${_target} ${temp}${target:1} >>/dev/null 2>&1
            status=$?
        fi
        
    else
        if [[ ${target:0:1} != "." ]]; then status=0
        else
            mv ${target} ${target:1} >>/dev/null 2>&1
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
        if [[ $? -eq 0 ]];then unhide
        else status=$?
        fi
    done
fi

# FINISH
exit $status
