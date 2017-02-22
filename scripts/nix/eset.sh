#!/bin/sh
rm ~/eset/*
wget --user=UserName --password=UserPass download.eset.com/download/engine/ess/offline_update_ess.zip
unzip ./offline_update_ess.zip -d ./eset
rm ./offline_update_ess.zip
