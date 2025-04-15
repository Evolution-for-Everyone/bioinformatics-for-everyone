# Tutoriel 1 : Introduction à la ligne de commande et à bash  
Par: Letícia Magpali

## Objectifs d'apprentissage
* [Ouvrir le terminal](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#1-opening-the-terminal)
* [La structure du terminal](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#2-the-structure-of-the-terminal)
* [Utiliser bash dans le terminal](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#3-using-bash-in-the--terminal)
* [Naviguer entre différents répertoires](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#-moving-between-different-directories) 
* [Créer des répertoires et des fichiers](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#-creating-directories-and-files)
* [Changer et déplacer des fichiers](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#-changing-and-moving-files)
* [Défi : créer une structure de dossiers](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#4-challenge-creating-a-folder-structure)
* [Installer des logiciels](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#5-installing-software)

## 1. Ouvrir le terminal

🍄 **Qu'est-ce que le terminal ?**  
Le terminal est une interface textuelle qui vous permet de communiquer avec votre ordinateur en tapant des commandes.  
Sur les systèmes Linux et MacOS, le terminal utilise un langage de programmation appelé **bash**.  
Vous pouvez utiliser le terminal pour faire tout ce que vous faites habituellement sur votre ordinateur ! (par exemple, exécuter des programmes, créer, éditer et accéder à des fichiers et dossiers.)

> [!TIP]
> _Qu'est-ce qui rend le terminal si particulier ?_  
> Il vous permet d'exécuter de nombreux programmes qui n'ont pas d'interface graphique !

De nombreux programmes utilisés pour l'analyse en biologie évolutive n'ont pas d'_interface graphique_ – cela signifie qu'ils n'ont ni application, ni écran, ni icônes cliquables, et nous devons interagir avec eux uniquement via des commandes.

🍄 **Où trouver le terminal ?**  
Le terminal ressemble à une autre application sur votre ordinateur – il peut cependant varier légèrement selon votre système d'exploitation (Linux, MacOS ou Windows). Suivez les instructions ci-dessous selon votre système :

→ **Pour les utilisateurs de MacOS/Linux**  
* Vous pouvez trouver le **terminal** dans la liste des applications (Launchpad) de votre ordinateur,  
* ou en utilisant l'option de recherche en appuyant sur la touche F4 (qui affiche une icône de loupe 🔍) puis en tapant `terminal` dans la zone de recherche.  
* L'icône du terminal ressemble à une boîte noire avec un `<` et un `-`, comme ceci :  
  <img src="https://github.com/user-attachments/assets/8c8aa650-9fb9-4275-a871-a96ea0fa190a" width="200">

→ **Pour les utilisateurs de Windows**  
* Le terminal natif de Windows ne fonctionne pas avec **bash**, il ne convient donc pas à nos besoins.  
* Sur Windows, il faut installer un environnement Linux pour accéder au terminal.  
* Pour cela, suivez [ce tutoriel écrit](https://learn.microsoft.com/en-us/windows/wsl/install) ou [ce tutoriel vidéo](https://www.youtube.com/watch?v=sUsTQTJFmjs&ab_channel=ProgrammingKnowledge).

🐞 Une fois que vous avez trouvé le terminal, lancez-le ! Il devrait s’ouvrir sous la forme d’une fenêtre noire affichant du texte en haut, comme ceci :

![Screenshot 2025-03-21 at 5 02 34 PM](https://github.com/user-attachments/assets/d1ca03b0-288d-47b1-879f-471da901e82b)

## 2. La structure du terminal

Chaque fois que vous ouvrez votre terminal, vous verrez les informations suivantes en haut à gauche :

``` bash
user@ordinateur répertoire % # si vous utilisez MacOS
    
user@ordinateur:répertoire$ # si vous utilisez Linux/Unix
```

> [!TIP]
> Ce texte s’appelle le **prompt** et indique que l’ordinateur est prêt à recevoir une commande – en d’autres termes, il vous _invite_ à taper une commande.

🍄 **Analysons maintenant les éléments du prompt :**

1️⃣ `user` et `ordinateur` représentent les noms que vous avez configurés pour vous-même et pour votre ordinateur.  
Par exemple, <ins>mon nom d'utilisateur est letixa et le nom de mon ordinateur est eugenio</ins>. Vous pouvez choisir n'importe quel nom !

2️⃣ `répertoire` est le dossier dans lequel vous vous trouvez actuellement (*en informatique, on utilise souvent le terme "répertoire" pour désigner un dossier*).  
* Certains systèmes d'exploitation n'affichent que le nom du répertoire tandis que d'autres affichent le chemin complet vers ce répertoire.  
* Quand vous ouvrez le terminal, le répertoire apparaît sous la forme de `~`, qui est un symbole représentant votre **répertoire personnel (HOME)**.

3️⃣ `$` ou `%` est le symbole du prompt, indiquant que le terminal attend une commande.  
Quand vous voyez ce symbole, vous pouvez commencer à taper vos commandes !

_Que signifie alors le `(base)` qui apparaît sur la capture d’écran ?_  
Cela indique dans quel environnement vous travaillez – nous en parlerons davantage plus tard.

## 3. Utiliser bash dans le terminal

> [!IMPORTANT]
> ### **Liste des commandes**
>
> * `pwd` – Affiche le répertoire de travail : montre le répertoire dans lequel vous vous trouvez actuellement.
> * `cd` – Changer de répertoire : permet de se déplacer vers un autre répertoire en spécifiant le chemin.
> * `ls` – Lister : affiche le contenu d'un répertoire (fichiers, sous-dossiers).
> * `mkdir` – Créer un répertoire : crée un nouveau dossier.
> * `nano` – Éditeur de texte : pour créer et modifier des fichiers texte.
> * `cat` – Concaténer : affiche le contenu d'un ou plusieurs fichiers.
> * `mv` – Déplacer : permet de déplacer ou renommer des fichiers ou dossiers.

### 🍄 Naviguer entre différents répertoires

**🐞 Tout d'abord, découvrons où nous nous trouvons** (c'est-à-dire notre répertoire de travail) <br>
Tapez `pwd` puis appuyez sur Entrée <br>
Vous devriez voir apparaître une ligne avec un chemin séparé par des barres obliques, comme dans l'exemple suivant :
    
```bash
(base) letixa@eugenio ~ % pwd   
/Users/letixa
```
    
**Cette ligne représente le chemin complet vers le dossier (répertoire) où vous vous trouvez actuellement.**  
Dans cet exemple, je suis dans mon répertoire personnel situé à `/Users/letixa`.

**🐞 Quels fichiers se trouvent dans mon répertoire personnel ?**  
Utilisez la commande `ls` pour le découvrir ! <br>
Tapez `ls` puis appuyez sur Entrée. Vous verrez apparaître une liste de noms de dossiers et de fichiers, par exemple :
    
```bash
(base) letixa@eugenio ~ % ls
Applications            Library                 Public
Desktop                 Mesquite_Support_Files  Zotero
Documents               Movies                  src
Downloads               Music                   zsh-syntax-highlighting
Google Drive            Pictures
```

**🐞 Maintenant, allons dans le dossier où nous souhaitons travailler !** <br>  
Choisissez un dossier dans votre répertoire personnel pour organiser vos fichiers de tutoriel. Ensuite, naviguez vers ce dossier en utilisant `cd` suivi du nom du dossier. <br>
Par exemple, pour accéder au dossier Documents :
    
```bash
(base) letixa@eugenio ~ % cd Documents
(base) letixa@eugenio Documents %
```
   
Remarquez que le répertoire affiché dans le prompt a changé de `~` à `Documents`, indiquant que vous êtes maintenant dans ce dossier !

**🐞 Et si je souhaite accéder à un dossier à l'intérieur d'un autre dossier ?** <br>
Dans ce cas, il faut préciser le chemin complet à partir de votre position actuelle, par exemple :
    
```bash
(base) letixa@eugenio ~ % cd Documents/work
(base) letixa@eugenio work %
```
Si vous tapez simplement :
    
```bash
(base) letixa@eugenio ~ % cd work
```
Vous obtiendrez une erreur :
    
```bash
(base) letixa@eugenio ~ % cd work
cd: no such file or directory: work
```

> [!TIP]
> **Ici, nous apprenons un principe important en ligne de commande :**  
> Une commande fonctionne seulement si vous l’exécutez depuis le bon emplacement !  
> Cela signifie :
> * Si le fichier ou le dossier ciblé par votre commande se trouve dans votre répertoire courant, vous pouvez taper `[commande] [espace] [nom du fichier/dossier]`
> * **Sinon**, si votre cible se trouve dans un autre emplacement, vous devez spécifier le chemin complet, c’est-à-dire taper `[commande] [espace] [chemin du fichier/dossier]`.

***

### 🍄 Créer des répertoires et des fichiers

_Maintenant que vous êtes dans le bon répertoire pour stocker vos tutoriels, organisons nos dossiers !_

**🐞 Créer un répertoire principal** <br>
Tout d’abord, créons un dossier principal qui contiendra tout ce qui concerne nos tutoriels. <br>
Tapez la commande `mkdir` suivie du nom que vous souhaitez donner au dossier, par exemple :
```bash
mkdir tutorials_2025
```
Vérifiez ensuite la création du dossier avec :
```bash
(base) letixa@eugenio Documents % ls
tutorials_2025
```
Entrez dans le dossier `tutorials_2025` avec :
```bash
cd tutorials_2025
```
Et vérifiez son contenu avec `ls` (il doit être vide) :
```bash
(base) letixa@eugenio tutorials_2025 % ls
```

**🐞 Créer un fichier README** \
Ensuite, créons un fichier README dans notre dossier principal à l’aide de la commande `nano` :
```bash
nano README.txt
```
Une fois la commande exécutée, vous verrez un écran noir vide (c'est normal, cela représente un fichier vierge). Tapez le titre de votre README, par exemple :
```
README - TUTORIELS DE BIOINFORMATIQUE 2025
```
Puis, pour sauvegarder et quitter, appuyez sur `Ctrl + X`, tapez `Y` puis Entrée.

Vérifiez la présence du fichier avec :
```bash
(base) letixa@eugenio tutorials_2025 % ls
README.txt
```

Vous pouvez modifier ce fichier ultérieurement en tapant :
```bash
nano README.txt
```
Pour en savoir plus sur `nano`, regardez [ce tutoriel vidéo](https://www.youtube.com/watch?v=g2PU--TctAM&ab_channel=SavvyNik).

**🐞 Pour afficher le contenu du fichier :** \
Utilisez la commande `cat` suivie du nom du fichier :
```bash
cat README.txt
```
La sortie sera similaire à :
```bash
(base) letixa@eugenio tutorials_2025 % cat README.txt 
README - TUTORIELS DE BIOINFORMATIQUE 2025
```

>[!NOTE]
> Pour approfondir ce sujet, essayez de rédiger le contenu complet de votre fichier README !  
> Pour plus d'informations sur comment rédiger un README, visitez [cette page](https://www.makeareadme.com/).

***

### 🍄 Changer et déplacer des fichiers

_Peu importe si vous voulez renommer ou déplacer un fichier, la commande `mv` vous permet de faire les deux. Voyons cela :_

**🐞 Renommer un fichier :**  
Si vous souhaitez renommer votre fichier README de `README.txt` à `README_tutorials.txt`, tapez :
```bash
mv README.txt README_tutorials.txt
```
Pour vérifier le résultat, utilisez :
```bash
ls
```
Le fichier devrait maintenant s'appeler :
```bash
README_tutorials.txt
```

**🐞 Déplacer un fichier :**  
Si vous avez créé votre fichier dans le mauvais dossier, vous pouvez le déplacer avec :
```bash
mv README.txt tutorials_2025
```
Ensuite, naviguez dans le dossier `tutorials_2025` et vérifiez avec :
```bash
cd tutorials_2025
ls
```
Le fichier devrait s'y trouver.

***

## 4. Défi : créer une structure de dossiers
_Tout bioinformaticien doit être organisé !_  
Dans ce défi, nous allons créer des dossiers pour stocker des données, des notes et des exercices.  
Avant de commencer, assurez-vous d'être dans le dossier `tutorials_2025`.

🐞 **Créer un dossier nommé `sandbox`** <br>
C'est un espace où vous pouvez tester sans compromettre vos analyses.
<details>
<summary>Afficher la commande</summary>

```bash
mkdir sandbox
```
</details>

🐞 **Créer un dossier pour chaque tutoriel** <br>
Par exemple, nommez-les `tutorial_1`, `tutorial_2`, etc. Il est recommandé d'utiliser des _tirets bas_ au lieu d'espaces.
<details>
<summary>Afficher la commande</summary>

```bash
mkdir tutorial_1 tutorial_2 tutorial_3 tutorial_4 tutorial_5 tutorial_6
```
</details>

Après avoir tapé `ls`, vous devriez voir quelque chose comme :
```bash
(base) letixa@eugenio tutorials_2025 % ls
README.txt  tutorial_1  tutorial_3  tutorial_5
sandbox     tutorial_2  tutorial_4  tutorial_6
```

> [!WARNING]
> **Vous rencontrez une erreur après avoir tapé une commande ?**  
> Vérifiez :
> * Que vous êtes dans le bon répertoire.  
> * Que les chemins spécifiés sont corrects.  
> * Qu'il n'y a aucune faute de frappe.
>  
> **Rappelez-vous :** Les ordinateurs n'interprètent que ce qu'on leur indique précisément !

## 5. Installer des logiciels

Pour conclure ce tutoriel, nous allons installer deux logiciels essentiels pour nos futurs travaux (et qui sont utiles en général) :
- **Homebrew** : gestionnaire de paquets pour MacOS  
  * Suivez les instructions sur [cette page](https://brew.sh/) pour installer Homebrew.
- **Git** : gestionnaire de dépôts  
  * Git nous aide à suivre les modifications de nos fichiers au fil du temps et est idéal pour le travail collaboratif.

**🐞 Installer Git sur MacOS :** 
```bash
brew install git 
# Cette commande utilise Homebrew pour installer Git sur votre ordinateur
```

**🐞 Installer Git sur Linux/Unix :** 
```bash
sudo apt-get install git-all
# Linux utilise la commande apt-get pour installer de nombreux programmes
```

> [!NOTE]
> Vous pouvez utiliser `git --version` pour vérifier la version de Git installée sur votre système.

