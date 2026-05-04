source func.sh
make factorielle;

points=0;
malus=0;

findMakefile;
findHeader;
checkEightyCharacters;
function_IntFactorielle;
positiveFactorielle;
factorielle0;
checkIndentation;

echo "-----------------------------------------------------------------";

note=$(echo "$points - $malus" | bc)
generateCSV $note;

echo "-----------------------------------------------------------------";
echo "points : $points";
echo "malus : $malus";
echo "note finale : $note";