#!/bin/bash
[ -f ./bokeh.pid ] && kill -s TERM $(cat ./bokeh.pid) &> /dev/null || kill -s KILL $(cat ./bokeh.pid) && rm -f ./bokeh.pid