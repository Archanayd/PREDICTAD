#perl calculateKmer.pl train_set.txt 1 >monofreq
#perl calculateKmer.pl train_set.txt 2 >difreq
Rscript PAAC.R
gsed -i "1 s|^|#SEQUENCE|" PAAC.tsv

Rscript CTDC.R
cut -f 1,2,3,4 CTDC.tsv > hydrophobicity
gsed -i "1 s|^|#SEQUENCE|" hydrophobicity
perl merge_kmersfile.pl PAAC.tsv hydrophobicity > svm_in.dat
