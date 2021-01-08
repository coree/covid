
#################
# 2: RUNNING OGER
#################

# JOSEPH'S NOTE: there is no vocab folder in './oger/' you have to get the 
#               'vocab/' folder first here I just downloaded the 'vocab/' folder
#               from Lenz located at: 
#               /srv/scratch1/furrer/OGER+BioBERT-inference/oger


home=$(pwd) # added by JOSEPH

cd $home/oger

# During this step, OGER will produce errors for some IDs. These should be
# noted manually in the bad_pmids.txt so that they will not be tried to DL
# again.

for value in CHEBI CL GO_BP GO_CC GO_MF MOP NCBITaxon PR SO UBERON
do
echo '2_PM: Running OGER for' $value
time oger run -s config/common.ini config/$value.ini -o ../data/oger/$value
echo ''
done

# # PMC
# for value in CHEBI CL GO_BP GO_CC GO_MF MOP NCBITaxon PR SO UBERON
# do
# echo '2_PMC: Running OGER for' $value
# screen -S $value -dm oger run -s config/common_pmc.ini config/$value.ini -o ../data/oger_pmc/$value
# echo ''
# done

# JOSEPH'S NOTE: there fist time you run the code this will throw errors

# 2: data housekeeping
cp ../data/oger/CHEBI/*.bioc_j  collection.bioc_json # this file is necessary for later merge
for value in CHEBI CL GO_BP GO_CC GO_MF MOP NCBITaxon PR SO UBERON
do
collection=$(ls -t ../data/oger/$value/*.conll | head -n1)
cp $collection ../data/oger/$value.conll
rm -r ../data/oger/$value
done

# # this file is necessary for later merge
# # fails if there's more than one file in CHEBI directory
# cp ../data/oger_pmc/CHEBI/*.bioc_j  collection_pmc.bioc_json
# for value in CHEBI CL GO_BP GO_CC GO_MF MOP NCBITaxon PR SO UBERON
# do
# collection=$(ls -t ../data/oger_pmc/$value/*.conll | head -n1)
# cp $collection ../data/oger_pmc/$value.conll
# rm -r ../data/oger_pmc/$value
# done
