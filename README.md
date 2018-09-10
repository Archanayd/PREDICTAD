# PREDICTAD
A machine leaning based tool to identify Transactivation domains

Types of Classifiers: support vector machines, Random forest



Step 1: Cut input sequences (in which prediction is to be done) into same length with an offset of 1 (single amino acid shift forward)
Length in our case: 9 amino acids
Folder name: 1_cut_seq
Program to cut seq into 9aa: prog.pl
NOTE: make sure the input sequences dont have new line characters

Step2: Generate descriptors for the 9 amino acid sequences
Directory name: 2_make_decriptors
Descriptors used: Pseudo amino acid composition (PAAC) & CTDC 
R Package used to generate decriptors: PROTR
Scripts in this directory:
	-script.sh 	# this is the MAIN script to run all three scripts below.
		- PAAC.R #to generate PAAC, change input_file name (9aa file) inside.
		- CTDC.R # to generate CTDC, change input_file name (9aa file) inside.
			 # CTDC.R outputs several psysicochemical properteis decriotors. we only use hydrophobicity decriptors from CTDC.tsv file 
		- merge_descriptors.pl # merge different discriptors into single file which will be used for classification in step 3.
	
Running script.sh will generate a file called svm_in.txt. this is the main input file for SVM light package
Note that svm_in.txt has headers of input 9amino acid sequences as the last column. This will help in tracking the results.

IMPORTANT: svm_in.txt file can also be used as input for WEKA as svm_in.dat

Step3: Run svm_classify (PREDICTION)

Directory name: 3_prediction
Essential files: descriptor file in which prediction has to be done: svm_in.txt
				 Trained model file: model.txt (genrated from training sequences)
				 Script to classify: svm_classify (from svm-light)
				 script2.sh: MAIN script to run svm classification. Running this script will generate a result file (result.txt) which will contain the svm scores wrt each input sequence.
				 
		OUTPUT:
		SVM_out: Output of svm_classify. Contains SVM scores with a + or - sign which denotes class label. 		 
		Result.txt : Contains svm result
		Positive_hits.txt : Contains positive hits that were detected		 	


	
