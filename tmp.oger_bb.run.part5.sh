
#################################
# 5: MERGING and COVID-ANNOTATION
#################################
home=$(pwd)

echo '5: Merging'
cd $home/oger
cp ../data/harmonised/CHEBI.conll collection.conll

oger run -s oger-settings-all.ini
mv ../data/merged/collection.json ../data/merged/collection.bioc.json

oger run -s oger-settings-pubannotation.ini
mv ../data/merged/collection.json ../data/merged/collection.pubannotation.json
mv ../data/merged/collection.tgz ../data/merged/collection.pubannotation.tgz

oger run -s oger-settings-eupmc.ini
mv merged-eupmc/collection.conll ../data/merged/collection.europmc.conll
mv merged-eupmc/collection.json ../data/merged/collection.europmc.json
mv merged-eupmc/collection.zip ../data/merged/collection.europmc.zip
rm -r merged-eupmc

# PMC
cp ../data/harmonised_pmc/CHEBI.conll collection_pmc.conll

oger run -s oger-pmc-settings.ini
mv ../data/merged_pmc/collection_pmc.json ../data/merged_pmc/collection_pmc.bioc.json

oger run -s oger-pmc-settings-pubannotation.ini
mv ../data/merged_pmc/collection_pmc.json ../data/merged_pmc/collection_pmc.pubannotation.json

# clean up
rm collection.conll collection_pmc.conll collection_pmc.bioc_json
