echo "Language | Langue:
1) English (default)
2) Français"
echo -n "Your choice | Votre choix: "
read lang
if [ $lang = 1 ] && [ -n $lang ]; then
  lang=("Bienvenue dans le générateur de fichier HTML par Exybore !" "Nom du fichier (par défaut: index.html): " "Auteur: " "URL: " "Titre: " "Description: " "Votre fichier a bien été généré dans $PWD !")
  locale="fr"
else
  lang=("Welcome to the HTML file generator by Exybore !" "File name (default: index.html): " "Author: " "URL: " "Title: " "Description: " "Your file has been generated in $PWD !")
  locale="en"
fi
echo ${lang[0]}
echo -n ${lang[1]}
read file
if [ -z $file ]; then
  file="index.html"
fi
echo -n ${lang[4]}
read title
echo '' >> $file
echo "<!--
  File was generated by the Exybore's HTML generator 0.1
  https://github.com/Exybore/sh-html-generator
  Contact: @exybore on Twitter | @Exybore@mstdn.io on Mastodon
-->
<!DOCTYPE html>
<html lang=\"$locale\">
<head>
  <title>$title</title>
  <meta charset=\"UTF-8\"/>
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>
  <meta property=\"og:title\" content=\"$title\"/>" >> $file
echo -n ${lang[2]}
read author
if [ -n $author ]; then
  echo "  <meta name=\"author\" content=\"$author\"/>" >> $file
fi
echo -n ${lang[3]}
read url
if [ -n $url ]; then
  echo "  <meta property=\"og:url\" content=\"$url\"/>" >> $file
fi
echo -n ${lang[5]}
read description
if [ -n $description ]; then
  echo "  <meta property=\"og:description\" content=\"$description\"/>" >> $file
fi
echo "</head>
<body>

</body>
</html>" >> $file
echo ${lang[6]}
