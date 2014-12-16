#!/bin/sh

# Porgram to output a system information page
PROGNAME=$(basename $0)
TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME, by $USER"

report_uptime () {
    cat <<- _EOF_
            <H2>System Uptime</H2>
            <PRE>$(uptime)</PRE>
_EOF_
    return
}

report_disk_space(){
    cat <<- _EOF_
            <H2>Disk Space Utilization</H2>
            <PRE>$(df -h)</PRE>
_EOF_
    return
}

report_home_space(){
    if test $(id -u) == 0; then
        cat <<- _EOF_
                <H2>Home Space Utilization</H2>
                <PRE>$(du -sh /home)</PRE>
_EOF_
    else
         cat <<- _EOF_
                    <H2>Home Space Utilization</H2>
                    <PRE>$(du -sh $HOME)</PRE>
_EOF_
    fi
    return
}

writeHtmlPage () {
    cat << _EOF_
     <HTML>
        <HEAD>
            <TITLE>$TITLE</TITLE>
        </HEAD>
        <BODY>
            <H1>$TITLE</H1>
            <p>$TIME_STAMP</p>
            $(report_uptime)
            $(report_disk_space)
            $(report_home_space)
        </BODY>
    </HTML>
_EOF_

return
}

usage(){
    echo $PROGNAME: usage: $PROGNAME [-f file | -i
    return
}
# process command line options

interactive=
filename=

while [[ -n $1 ]]; do
    case $1 in
        -f | --file)        shift
                            filename=$1
                            ;;
        -i | --interactive) interactive=1
                            ;;
        -h | --help)        usage >&2
                            exit 1
                            ;;
        *)                  usage >&2
                            exit 1
                            ;;
    esac
    shift
done

#Interactive Mode

if [[ -n $interactive ]]; then
    while true; do
        read -p "Enter name of output file: " filename
        if [[ -e $filename ]]; then
            read -p "'$filename' exists. Overwrite? [y/n/q] > "
            case $REPLY in
                Y|y)    break
                        ;;
                Q|q)    echo "Program terminated."
                        exit
                        ;;
                *)      continue
                        ;;
            esac
        elif [[ -z $filename ]]; then
            continue
        else
            break
        fi
    done
fi

#output html page

if [[ -n $filename ]]; then
    if touch $filename && [[ -f $filename ]]; then
        writeHtmlPage > $filename
    else
        echo "$PROGNAME: Cannot write file '$filename'" >&2
        exit 1
    fi
else
    writeHtmlPage
fi