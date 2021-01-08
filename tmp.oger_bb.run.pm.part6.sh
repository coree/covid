
#################
# 6: DISTRIBUTION
#################
home=$(pwd)

echo '6: Splitting, .tgz-ing and moving to DL directories'
cd $home

# 6.0 backing up

# 6.1 PUBANNOTATION / PUBMED

# Possibly, update PA collection with data/ids/pmids.txt or pmcids.txt first
# Upload this to PubAnnotation
cp data/merged/collection.pubannotation.json data/collection.pubannotation.json

# 6.1 PUBANNOTATION / PMC

# python -c 'import covid; covid.conll_collection_to_jsons(inpath="data/merged_pmc/collection_pmc.conll",outpath="data/pubannotation_pmc",sourcedb="PMC")'
# tar -czvf data/pubannotation_pmc.tgz data/pubannotation_pmc/

# 6.2 BRAT / PUBMED

# Creating Brat files and adding new files to directory
python -c 'import covid; covid.bioc_to_brat()'
cp -r /mnt/shared/apaches/transfer/brat/brat_ontogene/data/LitCovid /mnt/shared/apaches/transfer/brat/brat_ontogene/data/LitCovid.$(date +'%d%m%Y')
cp data/merged/brat/* /mnt/shared/apaches/transfer/brat/brat_ontogene/data/LitCovid

# 6.2 BRAT / PMC

# python -c 'import covid; covid.bioc_to_brat(inpath="data/merged_pmc/collection_pmc.bioc.json", outpath="data/merged_pmc/brat")'
# cp -r /mnt/shared/apaches/transfer/brat/brat_ontogene/data/LitCovidPMC /mnt/shared/apaches/transfer/brat/brat_ontogene/data/LitCovidPMC.$(date +'%d%m%Y')
# cp data/merged_pmc/brat/* /mnt/shared/apaches/transfer/brat/brat_ontogene/data/LitCovidPMC

# 6.3 File downloads : BioC / PubMed

cp data/merged/collection.bioc.json data/public/litcovid19.bioc.json
cp data/public/litcovid19.bioc.json /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid/litcovid19.bioc/litcovid19.$(date +'%d%m%Y').bioc.json
tar -czvf /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid/litcovid19.bioc.json.tgz /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid/litcovid19.bioc

# 6.3 File downloads : BioC / PMC

# cp /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC.$(date +'%d%m%Y')

# cp data/merged_pmc/collection_pmc.bioc.json data/public/covid19lit-pmc.bioc.json
# cp data/public/covid19lit-pmc.bioc.json /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC/covid19lit-pmc.bioc.json/covid19lit-pmc.$(date +'%d%m%Y').bioc.json
# tar -czvf /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC/covid19lit-pmc.bioc.json.tgz /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC/covid19lit-pmc.bioc.json

# 6.4 File downloads : TSV / PubMed

cp data/merged/collection.tsv data/public/litcovid19.tsv
cat data/public/litcovid19.tsv >> /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid/litcovid19.tsv
tar -czvf /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid/litcovid19.tsv.tgz /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid/litcovid19.tsv

# 6.4 File downloads: TSV / PMC

# cp data/merged_pmc/collection_pmc.tsv data/public/covid19lit-pmc.tsv
# cat data/public/covid19lit-pmc.tsv >> /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC/covid19lit-pmc.tsv
# tar -czvf /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC/covid19lit-pmc.tsv.tgz /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC/covid19lit-pmc.tsv

# 6.5 File downloads: TXT / PubMed

python -c 'import covid; covid.conll_collection_to_txts()'
cp data/public/txt/* /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid/litcovid19.txt
tar -czvf /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid/litcovid19.txt.tgz /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid/litcovid19.txt

# 6.5 File downloads: TXT / PMC

# python -c 'import covid; covid.conll_collection_to_txts(inpath="data/merged_pmc/collection_pmc.conll",outpath="data/public/txt")'
# cp data/public/txt/* /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC/covid19lit-pmc.txt
# tar -czvf /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC/covid19lit-pmc.txt.tgz /mnt/storage/clfiles/projects/clresources/pub.cl.uzh.ch/public/https/projects/COVID19/LitCovid-PMC/covid19lit-pmc.txt

# Verify for EuroPMC
# JOSEPH NOTE'S: is this pmc related ???
python -c 'import covid; covid.get_naked_conll()'