#!/bin/sh

if [ -f /sccripts/env_replace.sh ] then
    /bin/sh /scripts/env_replace.sh
    rm /scripts/env_replace.sh
else
    /bin/sh init.sh
fi