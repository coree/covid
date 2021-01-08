#!/bin/bash

home=$(pwd)

# Script cannot be run as is, since some steps take quite long
# Instead, copy & paste the individual steps as needed.

###########################
# 0: Setting up directories
###########################
echo '0: Creating directories, backing up old data'
mv data data.$(date +'%d%m%Y')
mkdir data data/ids/ data/oger/ data/biobert/ data/harmonised/ data/merged data/merged/brat/ data/public/ data/public/txt

# # For PMC:
# echo '0: Creating directories, backing up old data'
# mv data data.$(date +'%d%m%Y')
# mkdir data data/ids data/oger_pmc/ data/biobert_pmc/ data/harmonised_pmc/ data/harmonised_json data/pubannotation_pmc/ data/merged_pmc data/merged_pmc/brat/ data/public/ data/public/txt
