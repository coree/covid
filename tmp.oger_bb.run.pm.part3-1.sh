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

#? JOSEPH'S NOTE only if your are on the UZH server
# cd $home
# for SERVER in 1 2 3 ...
# do
# echo '3.2: Launching BB screens'
# ssh $SERVER 'bash -s' < run_bb_$SERVER.sh
# done

#? JOSEPH'S NOTE included by JOSEPH ------- start
declare -A vocabularies=( [CHEBI]=52715 [CL]=52714 [GO_BP]=52715 [GO_CC]=52712 [GO_MF]=52710 [MOP]=52710 [NCBITaxon]=52710 [PR]=52720 [SO]=52714 [UBERON]=52717 )

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

# ---- test only CHEBI
# for s in ids spans
# do

# echo "TEST ONLY FOR CHEBI for ..." $s
# mkdir ../data/biobert/CHEBI-$s

# python3 biobert_predict.py \
# 	--do_predict=true \
# 	--tf_record=../data/biobert.tf_record \
# 	--bert_config_file=common/bert_config.json \
# 	--init_checkpoint=models/CHEBI-$s/model.ckpt-52715 \
# 	--data_dir=models/CHEBI-$s \
# 	--output_dir=../data/biobert/CHEBI-$s \
# 	--configuration=$s

# done
# done
#? JOSEPH'S NOTE included by JOSEPH ------- end

# cd $home
# for SERVER in 1 2 3 ...
# do
# ssh $SERVER 'bash -s' < run_bb_pmc_$SERVER.sh
# done

# 3: data house keeping
cd $home/data
echo '3: Moving BB files'
cp -r biobert biobert.bkp

# if test only with CHEBI
# for v in CHEBI 

for v in CHEBI CL GO_BP GO_CC GO_MF MOP NCBITaxon PR SO UBERON
do
for s in spans ids
do
mv biobert/$v-$s/biobert.labels biobert/$v-$s.labels
rm -r biobert/$v-$s
done
done


# cd $home/data
# echo '3: Moving BB files'
# cp -r biobert_pmc biobert_pmc.bkp
# for v in CHEBI CL GO_BP GO_CC GO_MF MOP NCBITaxon PR SO UBERON
# do
# for s in ids spans
# do
# mv biobert_pmc/$v-$s/biobert_pmc.labels biobert_pmc/$v-$s.labels
# rm -r biobert_pmc$v-$s
# done
# done
