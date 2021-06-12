#!/bin/bash

# pwd = biobert
cd $home
unset vocabularies
declare -A vocabularies=( [CHEBI]=spans-first [CL]=spans-first [GO_BP]=spans-first [GO_CC]=spans-first [GO_MF]=spans-first [MOP]=spans-first [NCBITaxon]=ids-first [PR]=spans-only [SO]=spans-first [UBERON]=spans-first )

for k in "${!vocabularies[@]}"
do
    v=${vocabularies[$k]}
    echo "K: " $k
    echo "V: " $v

done