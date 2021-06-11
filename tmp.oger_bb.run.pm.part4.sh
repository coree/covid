#!/bin/bash
################
# 4: HARMONISING
################

home=$(pwd)

cd $home
unset vocabularies
declare -A vocabularies=( [CHEBI]=spans-first [CL]=spans-first [GO_BP]=spans-first [GO_CC]=spans-first [GO_MF]=spans-first [MOP]=spans-first [NCBITaxon]=ids-first [PR]=spans-only [SO]=spans-first [UBERON]=spans-first )

#zsh style arrays
for v k in ${(kv)vocabularies}
do
echo '4: Harmonising' $v
python harmonise.py -t data/harmonised/$v.conll -o data/oger/$v.conll -b data/biobert.tokens -i data/biobert/$v-ids.labels -s data/biobert/$v-spans.labels -m $k
done

# for v k in ${(kv)vocabularies}
# do
# echo '4: Harmonising' $v
# python harmonise.py -t data/harmonised_pmc/$v.conll -o data/oger_pmc/$v.conll -b data/biobert_pmc.tokens -i data/biobert_pmc/$v-ids.labels -s data/biobert_pmc/$v-spans.labels -m $k
# done
