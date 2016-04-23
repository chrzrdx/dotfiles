#!/bin/sh

#CACHE="$HOME/.cache/dmenu_cache_recent"
#
#touch $CACHE
#MOST_USED=`sort $CACHE | uniq -c | sort -r | colrm 1 8`
#RUN=`(echo "$MOST_USED"; dmenu_path | grep -vxF "$MOST_USED") | dmenu "$@"` &&
#(echo $RUN; head -n 99 $CACHE) > $CACHE.$$ && mv $CACHE.$$ $CACHE
#
#case $RUN in
#    *\;) exec `echo $TERMI $RUN | sed -e 's/;$//'`;;
#    *)   exec $RUN;;
#esac

#!/bin/sh
# Sort dmenu items by usage.
# https://github.com/tlvince/dmenu-tools/blob/master/src/dmenu_run_recent
# Copyright 2009-2013 Tom Vincent <http://tlvince.com/contact/>

CACHE="${CACHE:-${XDG_CACHE_HOME:-$HOME/.cache}/dmenu_run}"
[ -f "$CACHE" ] && CACHE="${CACHE}_recent" || CACHE="$HOME/.dmenu_cache_recent"

frequent=$([ -f "$CACHE" ] && sort "$CACHE" | uniq -c | sort -rn | colrm 1 8)
{ echo "$frequent"; dmenu_path | grep -vxF "$frequent"; } | \
  dmenu "$@" | tee -a "$CACHE" | "${SHELL:-/bin/sh}" &

