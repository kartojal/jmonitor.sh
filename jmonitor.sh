#! /bin/bash
# Author: David Canillas Racero @kartojal
# Git: https://github.com/kartojal/jmonitor.sh/
# Usage:
#   jmonitor -h -- Show this help.
#   jmonitor -q -- Kill all monitors.
#   jmonitor "/path/to/watch/java/sources" "/path/to/compile/classes" 
# 
#   Watch source directory for modified files. Compile all sources if
#   one file is modified in your project. Great for fast debugging Java
# Info:
#   - If you want to show more errors, modify "MAXJAVACERRORS"
#   - Add "source /path/to/jmonitor.sh" to your .bashrc file
#   - Script based from sahsanu answer:  http://superuser.com/questions/956311/continuously-detect-new-files-with-inotify-tools-within-multiple-directories-r
#   
###########################

jmonitor() {
    MAXJAVACERRORS=5
    CLEAR="yes"
    if [ -z "$*" ]; then 
        echo  "jmonitor: warning: no arguments."
        return 1
    elif [ "$1" == '-h' ]; then
        echo "jmonitor: Usage:"
        echo "jmonitor -h -- Show this help."
        echo "jmonitor -q -- Kill all monitors."
        echo "jmonitor \"/path/to/watch/java/sources/\" \"/path/to/compile/classes\" "
        echo "Watch source directory for modified files. Compile all sources if one file is modified in your project."
        return 0
        
    elif [ "$1" == "-q" ]; then
        killall inotifywait
        return 0
    fi

    inotifywait -m -r -e  modify --format "%f" "$1" | while read MODIFIEDFILE
    do
        if [ "$CLEAR" == "yes" ]; then
            clear
        fi
        echo "File ${MODIFIEDFILE} modified. Compiling..."
        cd "$1"
        javac -d "$2" -Xmaxerrs "$MAXJAVACERRORS" *.java && echo "Done"
    done
}
