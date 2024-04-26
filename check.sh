TEX="
tex/acknowledgements
tex/vita
tex/abstract
tex/introduction
tex/standard_model
tex/lhc_cms
tex/higgs_and_vbs
tex/vbswh
tex/vbsvvh
tex/lst
tex/cyber
"

for tex in $TEX; do
    aspell -c -t ${tex}.tex -d en
done
