##generate hydrophobicity descriptors
library("protr")
sequences = readFASTA("unknown_9aa.txt")

#
##x2 = t(sapply(sequences, props = c("CIDH920105"), extractMoreauBroto)) ##hydrophobicity
##x2 = t(sapply(sequences, props = c("CIDH920105", "BHAR880101", "CHAM820101", "CHAM810101"), extractMoreauBroto)) 

#x3 <- x2[ , ! apply( x2 , 2 , function(x) all(is.na(x)) ) ] # #delete NAs
#x4 <- sprintf("%.5f", round(x3, digits=5))


#CTD, Composition descriptor
x2 = t(sapply(sequences, extractCTDC)) 
x4 <- round(x2, digits=5)
##replace NA in between cells with -99999
x4[is.na(x4)] <- -99999 			

#x.fmt <- apply(x4, 1, function(x4) sprintf("%.5f", x4))


write.table(format(x4, digits=5), file='CTDC.tsv', quote=FALSE, sep='\t', col.names = NA)
#write.table(x.fmt, file='CTDC.tsv',  sep='\t', col.names = NA)