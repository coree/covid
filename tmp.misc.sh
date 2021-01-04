cd vocab

for value in CHEBI CL GO_BP GO_CC GO_MF MOP NCBITaxon PR SO UBERON
do
echo 'creating .tsv file' $value
touch $value.tsv
echo ''
done
cd ..