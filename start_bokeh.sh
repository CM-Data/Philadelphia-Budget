#!/bin/bash
[ -f ./bokeh.pid ] && { ! egrep -iq $( cat ./bokeh.pid ) <( ps aux | grep -v 'VSZ   RSS' | awk '{print "^" $2 "\$";}' 2>/dev/null ) && {
        echo "no bokeh instance detected but pidfile still exists; removing it" ;
        rm -f ./bokeh.pid ;
    } || { echo "running bokeh instance detected (pid $(cat ./bokeh.pid)); exiting" && exit 1 ; } }
bokeh serve PhiladelphiaBudgetPlot.py --show --port 5600 >> bokeh_log 2>&1 &
echo "${!}" > ./bokeh.pid
