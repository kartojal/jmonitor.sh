## jmonitor.sh
Bash script that monitors your java source directory, and compile all sources every time you modify any .java file.

## Usage:
  jmonitor -h -- Show this help.
  jmonitor -q -- Kill all monitors.
  jmonitor "/path/to/watch/java/sources" "/path/to/compile/classes"
  Watch source directory for modified files. Compile all sources if one file is modified in your project. Great for fast debugging Java at console.
## Info:
 - If you want to show more errors, modify "MAXJAVACERRORS"
 - Add "source /path/to/jmonitor.sh" to your .bashrc file. Reload your terminal.
 - Script based from sahsanu answer:  http://superuser.com/questions/956311/con tinuously-detect-new-files-with-inotify-tools-within-multiple-directories-r

