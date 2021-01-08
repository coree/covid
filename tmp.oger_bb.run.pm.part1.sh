
################
# 1: Getting IDs
################
echo '1: Downloading PMIDs'
python -c 'import covid; covid.get_pmids()'

# differences (change date to last time you ran the pipeline)
# JOSPEH'S NOTE: change the name of the data.03012021 to the lastest date (data.?????)
diff --new-line-format="" --unchanged-line-format="" data/ids/all_pmids.txt data.08012021/ids/all_pmids.txt > data/ids/pmids.txt


# for PMC, use the pmcods_to_txt() from covid.py
# place the pmcids.txt file from the last run's data/ids into the current data/ids
# and rename it to old_pmcids.txt. Place the new .ods into the new data/ids, too
# JOSPEH'S NOTE: there might be no .ods file just create one with *excel* and enter in the first row and column "PMCID"
# JOSPEH'S NOTE: create an empty old_pmcids.txt file
# python -c 'import covid; covid.pmcods_to_txt(inpath="data/ids/PMID-PMCID_02092020.ods")'

