Casier Sofian
Orieux Baptiste
TP Pierre-Feuille-Ciseaux

Tp entierement fonctionnel. Les tests de la classe Game sont assez réduits car les methodes necessitent une intervention de la part d'un utilisateur.

Pour compiler le programme, placez vous dans le dossier src  et tapez la commande ;
javac game/utils/*.java -d ../classes
javac game.*.java -d ../classes
Ou tapez make dans le dossier racine

Pour Executer le programme, placez vous a la racine et tapez la commande :
java -classpath classes game.Main 'x'
avec x un chiffre supérieur a 0.

Pour compiler les tests, placez vous a la racine et taper la commande:
javac -classpath test-1.7.jar test/*.java

Pour executer les tests, placez-vous a la racine et taper la commande:
java -jar test-1.7.jar NomDeClasseTest
