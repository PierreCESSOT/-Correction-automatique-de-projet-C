source func.sh


points=0;
malus=0;


# find Makefile && find clean in Makefile
findMakefile;
# find .h file
findHeader;


echo "-----------------------------------------------------------------";
echo "points : $points";
echo "malus : $malus";


