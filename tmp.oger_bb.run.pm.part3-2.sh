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
