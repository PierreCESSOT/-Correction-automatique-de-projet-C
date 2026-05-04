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
negativefactorielle;
nombreParametre;

note=$(echo "$points - $malus" | bc)
note=$(echo "if ($note < 0) 0 else if ($note > 20) 20 else $note" | bc)

generateCSV $note;

echo "points : $points";
echo "malus : $malus";
echo "note finale : $note";