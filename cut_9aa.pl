#Usage perl prog.pl INPUT.txt > out.txt
open (IN, $ARGV[0]);

while (<IN>){ 
if (/^>(.*)/){ $id= $1; chomp $id; $i=1;}
else{ $fasta = $_;
for($i=0; $i<=length($fasta);$i=$i+1){ 
$substr = substr($fasta, $i, 9); chomp$substr;
if (length($substr) >= 9){$count=$i;
print ">$count"."_$id\n";
print "$substr\n";

}}
}
} exit;
