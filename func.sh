findCleanInMakefile()
{
	isCleanTarget=$(grep -E "^clean" ./Makefile | wc -l);
	isCleanCmd=$(grep -E "rm -[rf]" ./Makefile | wc -l);

	if [ "$isCleanTarget" -gt 0 ] && [ "$isCleanCmd" -gt 0 ]; then 
		echo "Clean in Makefile : yes";
	else
		echo "Clean in Makefile : no";
		((malus+=2));
	fi
}
findMakefile()
{
	isMakefile=$(find -name "Makefile" | wc -l);

	if [ "$isMakefile" -gt 0 ]; then
		echo "Makefile : yes";
		((points+=2));
		findCleanInMakefile;
	else 
		echo "Makefile : no";
		((malus+=20));
	fi
}
findHeader()
{
	isHeader=$(find -name "*.h" | wc -l);
	if [ "$isHeader" -gt 0 ]; then
		echo "header : yes";
	else
		echo "header : no";
		((points+=2));
	fi
}
81Characters()
{
	countChar=$(grep -E ".{81,}$" *.[ch] | wc -l);
	if [ $countChar -eq 0 ]; then
		echo "+81 Char : no";
	else
		echo "+81 Char : yes";
		((malus+=2));
	fi

}