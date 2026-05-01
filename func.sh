findCleanInMakefile()
{
	isCleanTarget=$(grep -E "^clean" ./Makefile | wc -l);
	isCleanCmd=$(grep -E "rm -[rf]" ./Makefile | wc -l);

	if [ "$isCleanTarget" -gt 0 ] && [ "$isCleanCmd" -gt 0 ]; then 
		echo "Clean in Makefile : yes";
	else
		echo "Clean in Makefile : no";
		let "malus+=1";
	fi
}
findMakefile()
{
	isMakefile=$(find -name "Makefile" | wc -l);

	if [ "$isMakefile" -gt 0 ]; then
		echo "Makefile : yes";
		let "points+=2";
		findCleanInMakefile;
	else 
		echo "Makefile : no";
		let "malus+=20";
	fi
}
findHeader()
{
	isHeader=$(find -name "*.h" | wc -l);
	if [ "$isHeader" -gt 0 ]; then
		echo "header : yes";
	else
		echo "header : no";
		let "malus+=1";
	fi
}