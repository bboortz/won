#!/bin/bash

while true; do
    for f in ./measure/*.sh; do
        $f &
    done

    echo -ne "."
    sleep 3
done
