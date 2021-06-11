#!/bin/bash
####################
# 3: RUNNING BIOBERT
####################

# JOSEPH'S NOTE: 1. install tensorflow (1.15.0) this is not mentioned in the requirments
#                2. the ./biobert/modeling.py and ./biobert/tokenization.py file is missing
#                   I downloaded it from /srv/scratch1/furrer/OGER+BioBERT-inference/biobert
#                3. install keras (2.3.1) this is not mentioned in the requirments
#                4. the ./biobert/commmon folder is missing
#                   I downloaded it from /srv/scratch1/furrer/OGER+BioBERT-inference/biobert
#                5. looping through array with declare and ${!var[@]} dosen't work with a z-shell


home=$(pwd) # added by JOSEPH

cd $home/biobert

# Preprocess data for BioBert
#? JOSEPH'S NOTE the preprocessing only needs to be done once with one arbitrary .conll file

# echo '3.1: Preprocessing for BB'

# time python3 biobert_predict.py \
# --do_preprocess=true \
# --input_text=../data/oger/CHEBI.conll \
# --tf_record=../data/biobert.tf_record \
# --vocab_file=common/vocab.txt

# refer to the readme.md for more information
# to restrict CPU usage, change variables in tf_threads.py

#? JOSEPH'S NOTE included by JOSEPH ------- start
declare -A vocabularies=( [NCBITaxon]=52710 )

for v in "${!vocabularies[@]}"
do

for s in ids spans
do

echo "BB for" $v-$s
mkdir ../data/biobert/$v-$s

python3 biobert_predict.py \
	--do_predict=true \
	--tf_record=../data/biobert.tf_record \
	--bert_config_file=common/bert_config.json \
	--init_checkpoint=models/$v-$s/model.ckpt-${vocabularies[$v]} \
	--data_dir=models/$v-$s \
	--output_dir=../data/biobert/$v-$s \
	--configuration=$s\
	--vocab_file=common/vocab.txt

done
done
