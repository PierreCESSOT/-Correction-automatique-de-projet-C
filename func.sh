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
80Characters()
{
	countChar=$(grep -E ".{81,}" *.[ch] | wc -l)
	if [ "$countChar" -gt 0 ]; then
        echo ">80 Char : yes"
        ((malus+=2))
    else
        echo ">80 Char : no"
    fi
}
function_IntFactorielle()
{
	function=$(grep -E "(int factorielle\( int number \))" *.[c] | wc -l);
	signature=$(grep -E "(int factorielle\( int number \))" *.[h] | wc -l);
	if [ "$function" -gt 0 ]; then
		echo "Function int factorielle : yes";
		((points+=2));
	else
		echo "Function int factorielle : no";
	fi
	if [ "$signature" -gt 0 ]; then
		echo "Signature int factorielle : yes";
	else
		echo "Signature int factorielle : no";
		((malus+=2));
	fi
}
checkIndentation() 
{
	tabCount=$(grep -P "^\t" *.[ch] | wc -l)
	badIndent=$(grep -P "^ +" *.[ch] | grep -Pv "^( {2})+[^ ]" | grep -Pv "^ +$" | wc -l)

	if [ "$tabCount" -gt 0 ] || [ "$badIndent" -gt 0 ]; then
		echo "Wrong Indentation : no"
		((malus+=2))
	else
		echo "Wrong Indentation : yes"
	fi
}
positiveFactorielle()
{
	isNotEqual="false";
	result=1;
	projectResult=0;
	for i in {1..10}
	do
		((result*=i));
		projectResult=$(./factorielle $i);

		if [ "$result" != "$projectResult" ]; then
			echo "factorielle : not equal";
			$isNotEqual="true";
		fi
	done
	if [ "$isNotEqual" = "true" ]; then
		echo "factorielle 1-10: no"
	else
		echo "factorielle 1-10: yes"
		((points+=5));
	fi
}
factorielle0()
{
	projectResultFactorielle0=$(./factorielle 0);
	if [ "$projectResultFactorielle0" = "1" ]; then
		echo "factorielle 0=1: yes"
		((points+=3));
	else
		echo "factorielle 0=1: no"
	fi
}

