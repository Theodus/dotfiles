#!/bin/sh

set -e
set -u

[ $# -lt 2 ] && echo "usage: $0 host path [args]" && exit 1

host=$1
path=$2

shift 2

rsync -avzPR . "$host:$path" $@

