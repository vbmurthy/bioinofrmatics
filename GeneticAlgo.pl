# Written by Tariq Abdullah
# Author, Bioinformatics Review
# tariq@bioinformaticsreview.com
# www.bioinformaticsreview.com

$CurrentHighest=0;

@GeneExpressionData = (1,3,8,5,2,4,46,6,78,7,9,9,0,1,1,1,5,59,9,97,7,6,5,45,4,3,23,2,22,2,2,4,5,5,6,54);
@SolutionSpace = ();
$HighestMutationValue = 110;
$GeneNumberConstraint = 5;
$InitialThreshold  = 10;
$genes	= scalar @GeneExpressionData;
@chromosome = ();
 $sum = 0;
$steps= 10;

print "The Total Genes are: $genes\n";

generate();
$steps = 10;
	for($p=0;$p<=$steps;$p++)
	{
		generate();
		SurvivalCheck();
		mutate();
		SurvivalCheck();
		recombine();
		SurvivalCheck();
		
	}


print "\n\n Genetic Algorithm Result\n\n\n\t\tHighest Detected: $CurrentHighest in $steps Steps\n\n";


sub mutate{
		$randpos = int(rand($gene));
		$n = int(rand($HighestMutationValue));
		$chromosome[$randpos] = $n;
		print "\n Mutation Took Place in Chromosome @chromosome ";
}

sub recombine
{
	print "\nRecombining\n\n";
		
	@chromosome1 = $SolutionSpace[int rand($p)];
	@chromosome2 =  $SolutionSpace[int rand($p)];
	print "Random Sequence Chromosome from Solution Space: @chromosome1 and @chromosome2";
	for($i=0; $i<=$GeneNumberConstraint/2; $i++)
	{
		 my $random_number = int(rand(3)) + 1;
		 $pos1 = int(rand($GeneNumberConstraint));
  		 $pos1 = int(rand($GeneNumberConstraint));
		 $swap = $chromosome1[$pos1];
		 $chromosome1[$pos1] = $chromosome2[$pos2];
		 $chromosome2[$pos2] = $swap;
		
	}
	
	print "The Recombination led to @chromosome";
	
	@chromosome = ();
	@chromosome = @chromosome1;
}

sub SurvivalCheck
{
	
	$sum = 0;
	foreach $val (@chromosome)
	{
			$sum += $val;
	}
	if($sum>$CurrentHighest)
	{	$CurrentHighest = $sum;
		push @SolutionSpace, @chromosome;
		print "\nIndividual is alive! \nCurrent Highest Expression: $CurrentHighest";		return 1;
	}
	else
	{
		print "\nSpecies Didn't Survive! \n"; 
return 0;
	}
	
}

sub generate
{
	@chromosome = ();
	for($i=1;$i<=$GeneNumberConstraint;$i++)
	{
		$n = int(rand($genes));
		push @chromosome, $GeneExpressionData[$n];
		$sum += $GeneExpressionData[$n];
		
	}
	
	
	print "\n\n\nGenerated Chromosome: @chromosome \n";

}
