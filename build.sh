#!/usr/bin/env bash

stack --stack-yaml stack-base.yaml setup
stack --stack-yaml stack-base.yaml install alex happy hscolour

PATH=`stack path --bin-path  --stack-yaml stack-base.yaml 2>/dev/null`:$PATH
echo SETUP
date
node --version
stack -v setup
echo BUILD
date
stack build
date
PP=`stack path --local-install-root`/bin/reflex-todomvc.jsexe
#servius -d $PP -p 3301 &
#WW=$!

stack build --file-watch
#echo CLOSURE-COMPILE
#ccjs $PP/all.js --compilation_level=ADVANCED_OPTIMIZATIONS --externs=node > ../server/static/v2.js

#kill $WW

local_install_root=$(stack path --local-install-root)
echo "open in your browser: $local_install_root/bin/reflex-todomvc.jsexe/index.html"
