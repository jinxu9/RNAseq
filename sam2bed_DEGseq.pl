#!/usr/bin/perl
while(<>)
{
chomp;
my $strand="";
my @a=split;
if ($a[1]==99 ||$a[1]==147)
{$strand="+";
print $a[2],"\t",$a[3],"\t",$a[3]+length($a[9]),"\t",$a[0],"\t","0\t",$strand,"\n";
}
if($a[1]==83 ||$a[1]==163) 
{$strand="-";
print $a[2],"\t",$a[3],"\t",$a[3]+length($a[9]),"\t",$a[0],"\t","0\t",$strand,"\n";
}
}

