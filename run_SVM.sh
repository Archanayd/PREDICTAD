

awk '{print $(NF)}' svm_in.txt>x #print last column
./svm_classify svm_in.txt model.txt svm_out.txt
paste x svm_out.txt> result.txt
#collect all positive results to one file
awk '$2 !~"-"{print}' result.txt >positive_hits.txt
