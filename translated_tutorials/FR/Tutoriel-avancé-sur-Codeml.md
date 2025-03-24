# Tutoriel avancé sur Codeml

Par: Joseph Bielawski


***


Atelier 2022 sur l'évolution moléculaire au MBL

***


Suivez ce [lien pour retourner à la page du programme de l'atelier](https://molevolworkshop.github.io/schedule/).

Suivez ce [lien pour retourner à la page de la faculté Bielawski](https://molevolworkshop.github.io/faculty-bielawski/).

## Aperçu
L'objectif de cette activité est de vous aider à comprendre comment utiliser différents modèles de codons, et comment tester la sélection en utilisant PAML (et plus précisément le programme CODEML). Les activités sont conçues pour développer des compétences analytiques générales, et sont tout aussi pertinentes pour des analyses réalisées avec d'autres logiciels, tels que HyPhy.

Le tutoriel est divisé en 4 exercices.

1. Estimation du maximum de vraisemblance (à la main)  
2. Sensibilité de _ω_  
3. Tests du rapport de vraisemblance (LRT) pour des hypothèses alternatives concernant les changements temporels de la pression de sélection  
4. Test pour les sites évoluant sous sélection positive dans le gène nef du VIH-2

**REMARQUE : À partir de 2023, dans l'Atelier sur l'évolution moléculaire, nous ne ferons QUE les exercices 1, 3 et 4. Cela inclut l'étape optionnelle (n° 8) de l'exercice 4.**

La section suivante (**Accès aux fichiers**) décrit comment accéder et travailler avec les fichiers requis pour chacun des exercices. Vous accéderez aux fichiers différemment selon que vous fassiez les laboratoires lors de l'atelier ou à domicile de manière indépendante.

**Note** que l'exécution du programme implique de modifier les fichiers d'entrée et de créer des fichiers de sortie. _Il est recommandé de (i) créer un répertoire séparé pour chaque exercice ou analyse de données réelles que vous souhaitez réaliser et (ii) enregistrer et sauvegarder des notes en texte simple sur la motivation et les détails de chaque analyse de données réelles et de les stocker dans le répertoire créé pour chaque analyse._ Ce dernier est une sorte de fichier « read me » dont vous serez content après avoir réalisé de nombreuses analyses sur vos données réelles et commencé à oublier ou à mélanger les détails.

Voici les diapositives pour l'activité d'apprentissage de PAML : [2024_slides](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/resources/pamlDEMO_2024.pdf)

Voici une copie du chapitre de livre qui accompagne ces exercices : [Book_Chapter.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/resources/Bielawski_book_chapter.pdf)

Cette [page](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/Resources.html) contient des liens vers des documents utiles et de nombreuses ressources supplémentaires.


## Accès aux fichiers

### **1. Si vous faites le laboratoire LORS DE L'ATELIER**: 
Sur les machines virtuelles que nous utiliserons lors de l'atelier 2022, il y aura un lien symbolique dans votre répertoire personnel nommé "moledata" qui vous dirigera vers les fichiers de données du cours. Vous y trouverez des répertoires pour les différents laboratoires (par exemple, MSAlab, revbayes, PamlLab, etc.).

Pour afficher la liste des laboratoires, tapez:

`ls ~/moledata`

Pour afficher le contenu du laboratoire Paml, tapez:

`ls -1 ~/moledata/PamlLab`

Cela révélera les répertoires pour chaque exercice:

`ex1`  
`ex2`  
`ex3`  
`ex4`

Les fichiers sont déjà sur la machine virtuelle que vous utilisez. _Cependant, vous voudrez exécuter chaque exercice dans un répertoire séparé que vous créerez_. Donc, créez un nouveau répertoire. Le nom du nouveau répertoire vous appartient, mais choisissez quelque chose d'informatif (par exemple, `~/PAML_ex1`).

Pour _copier_ les fichiers requis pour l'exercice 1, tapez simplement:

`cp ~/moledata/PamlLab/ex1/* ~/PAML_ex1`

Vous êtes maintenant prêt à faire l'exercice 1 dans `~/PAML_ex1`


### **2. Renommage des fichiers:** 
Pour tous les exercices, vous devrez renommer le fichier de contrôle en supprimant le préfixe de l'exercice (exN). Vous pouvez le faire en utilisant la commande `cp`.

Voici un exemple pour l'exercice 1:

`cp ex1_codeml.ctl codeml.ctl`

AVERTISSEMENT: Relancer PAML dans un répertoire écrasera tous les fichiers de ce répertoire! Assurez-vous de renommer tous les fichiers que vous souhaitez conserver!


### **3. Si vous faites le laboratoire de manière INDÉPENDANTE de l'atelier:** 
Vous pouvez réaliser ce laboratoire en téléchargeant tous les fichiers nécessaires depuis une archive [ici](https://bitbucket.org/EvoWorks/protocol-paml-lab-at-mbl-workshop/downloads/), ou vous pouvez télécharger les fichiers individuellement pour chaque exercice selon vos besoins [ici](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/PAML_Lab_files.html).

Quoi qu'il en soit, il est toujours _"best practice" de réaliser chaque exercice dans un répertoire de travail séparé que vous créerez (par exemple, `PAML_ex1`), et de travailler avec des copies des fichiers requis dans ce répertoire._


## Exercice 1
L'objectif de cette activité est d'utiliser CODEML pour évaluer la vraisemblance des séquences GstD1 pour une variété de valeurs de _ω_. Tracez les scores de log-vraisemblance en fonction des valeurs de _ω_ et déterminez l'estimation du maximum de vraisemblance (MLE) de _ω_. Vérifiez votre résultat en exécutant l'algorithme de montée de colline de CODEML.

![Concept_figure1](https://github.com/user-attachments/assets/869cb3c5-5530-488f-8ebd-4f0e7cf027af)

1. Trouvez les fichiers d'entrée pour l'exercice 1 (**ex1_codeml.ctl, seqfile.txt**) et familiarisez-vous avec eux. Payez une attention particulière au contenu du fichier de contrôle modifié appelé **ex1_codeml.ctl**.

2. N'oubliez pas de créer un répertoire où vous souhaitez enregistrer vos résultats, et placez-y tous vos fichiers. Ouvrez ensuite un terminal, déplacez-vous dans le répertoire contenant vos fichiers. Lorsque vous êtes prêt à exécuter CODEML, supprimez le préfixe **ex1_** (le fichier de contrôle doit être nommé **codeml.ctl**). Vous pouvez alors lancer CODEML.

3. Familiarisez-vous avec les résultats (voir les annotations dans [ex1_HelpFile.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise1/ex1_HelpFile.pdf)). Si vous n'avez pas modifié le fichier de contrôle, les résultats seront écrits dans un fichier appelé **results.txt**. Identifiez la ligne dans le fichier de résultats qui donne le score de vraisemblance pour l'ensemble de données exemple.

4. _Maintenant, modifiez et enregistrez_ le fichier de contrôle et relancez CODEML pour une valeur fixe différente de _ω_. Le "guide rapide" du fichier de contrôle peut vous être utile ici ([guide rapide](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise1/ex1_control_file_QuickGuide.pdf)). L'objectif est de calculer la vraisemblance de l'ensemble de données exemple pour une valeur fixe de _ω_. _Modifiez le fichier de contrôle comme suit:_

   * Changez le nom de votre fichier de résultats (via `outfile=` dans le fichier de contrôle) sinon vous écraserez vos résultats précédents!

   * Changez la valeur fixe de omega en modifiant la valeur de `omega=` dans le fichier de contrôle. Les valeurs pour cet exercice sont fournies en commentaires au bas du fichier de contrôle exemple qui vous a été fourni.

5. Répétez l'étape 4 pour chaque valeur de _ω_ selon les commentaires du fichier de contrôle exemple (par exemple, _ω_ = 0.005, 0.01, 0.05, 0.1, 0.2, 0.4, 0.8, 1.6, 2.0).

6. Utilisez votre tableur ou logiciel statistique préféré pour tracer le score de vraisemblance (axe des y) en fonction de la valeur fixe de omega (axe des x). Utilisez une échelle logarithmique pour l'axe des x (ne transformez pas _ω_). Votre graphique devrait ressembler à ceci: [ex1 plot template.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise1/ex1_plot_template.pdf) (remarque: les points de données ont été intentionnellement omis dans cette version du graphique; vous devez générer les données vous-même).

   * Pour obtenir de l'aide sur la création de vos graphiques, consultez les ressources supplémentaires sur [cette page](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/Resources.html).

7. D'après votre graphique, essayez de répondre à cette question:

   * _Quelle est la valeur de _ω_ qui maximisera le score de vraisemblance (c'est-à-dire le MLE)?_

8. Changez maintenant le fichier de contrôle afin que CODEML utilise son algorithme de montée de colline pour trouver le MLE; définissez `fix_omega=0` dans le fichier de contrôle. Comparez le résultat à votre estimation de l'étape 7.

   * _Quelle a été la qualité de votre estimation du MLE?_


## Exercice 2
Dans cet exercice, vous étudierez la sensibilité de _ω_ au rapport transition/transversion (kappa), ainsi qu'aux fréquences de codons supposées (_π's_). Après avoir collecté les données requises, vous déterminerez quelles hypothèses donnent les valeurs de S les plus élevées et les plus basses, et quel effet cela a sur la valeur de _ω_.

![Concept_figure2](https://github.com/user-attachments/assets/e185f81c-3b52-4486-b1ec-2b6ba7b055b0)

1. Trouvez les fichiers pour l'exercice 2 (**ex2_codeml.ctl, seqfile.txt**) et familiarisez-vous avec eux. Il est préférable de créer un nouveau répertoire pour l'exercice 2. Lorsque vous êtes prêt à exécuter CODEML, supprimez le préfixe **ex2_** (le fichier de contrôle doit être nommé **codeml.ctl**).

2. Lancez CODEML en utilisant les paramètres indiqués dans le fichier de contrôle pour l'exercice 2. Familiarisez-vous avec les résultats ([ex2 HelpFile.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise2/ex2_HelpFile.pdf)). En plus du score de vraisemblance, vous devez être capable d'identifier la partie du fichier de résultats qui fournit les estimations des éléments suivants:

   * Nombre de sites synonymes ou non-synonymes (S et N)

   * Taux synonymes et non-synonymes (dS et dN)

3. Comme dans l'exercice 1, vous devrez _modifier et enregistrer_ le fichier de contrôle et relancer CODEML. Le "guide rapide" du fichier de contrôle peut vous être utile ici ([guide rapide](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise2/ex2_control_file_QuickGuide.pdf)). L'objectif est de calculer la vraisemblance de l'ensemble de données exemple sous différentes hypothèses de modèle. Pour ce faire, vous devez:

   * _Changer_ le nom du fichier de résultats principal (via `outfile=` dans le fichier de contrôle) sinon vous écraserez vos résultats précédents.

   * _Changer_ les hypothèses du modèle concernant les fréquences de codons (via `CodonFreq=`) et kappa (via `kappa=` et `fix_kappa=`).

4. Répétez l'étape 3 pour chaque ensemble d'hypothèses concernant les fréquences de codons et kappa indiquées en commentaires au bas du fichier de contrôle exemple, et illustrées dans la figure ci-dessous.

![Concept_figure2 2](https://github.com/user-attachments/assets/f5872c74-79fb-4d5c-b1b3-7f212b0dd7d2)

5. Dans votre logiciel de tableur préféré, créez un tableau semblable à **Table E2** des diapositives (voir [ex2 table template.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise2/ex2_table_template.pdf)) et complétez-le avec vos résultats.

6. Utilisez votre tableau pour déterminer:

   * _Quelles hypothèses donnent les valeurs de S les plus élevées et les plus basses?_
   * _Quel est l'effet sur _ω_?_
   * _Quel modèle choisiriez-vous?_


## Exercice 3
L'objectif de cet exercice est d'utiliser trois tests du rapport de vraisemblance (LRT) pour évaluer les possibilités suivantes: (1) le taux de mutation de Ldh-C a augmenté par rapport à Ldh-A, (2) une explosion de sélection positive pour une divergence fonctionnelle s'est produite suite à l'événement de duplication ayant donné naissance à Ldh-C, et (3) il y a eu un changement à long terme dans les contraintes sélectives suite à l'événement de duplication ayant donné naissance à Ldh-C.

1. Obtenez les fichiers pour l'exercice 3 depuis le site du cours (**ex3_codeml.ctl, seqfile.txt, treeH0.txt, treeH1.txt, treeH2.txt, treeH3.txt**). Les fichiers d'arbre représentent différentes hypothèses notées H0, H1, H2 et H3 (voir le schéma ci-dessous, ou téléchargez ce fichier [genetree](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise3/LDH_gene_tree.pdf)). Ces concepts évolutifs décrits ci-dessus sont couverts par ces quatre hypothèses précises:

   * H0: Pression de sélection homogène sur l'arbre (concept = toute différence de taux est due à des changements du taux de mutation).

   * H1: Changement épisodique de la pression de sélection dans Ldh-C (concept = uniquement dans la branche qui suit immédiatement l'événement de duplication du gène).

   * H2: Changement à long terme de la pression de sélection uniquement dans Ldh-C (concept = Ldh-C a une nouvelle pression de sélection par rapport à ses ancêtres, alors que Ldh-A reste soumis au niveau de sélection ancestral).

   * H3: Changement à long terme de la sélection sur Ldh-C et Ldh-A (concept = les deux lignées paralogues subissent de nouvelles pressions de sélection; c'est-à-dire, différentes l'une de l'autre et de l'ancêtre).

![LDH_gene_tree](https://github.com/user-attachments/assets/fd5d3ebc-de43-41e1-ba1b-a0fc7bcfbf07)

2. Lancez CODEML en utilisant les paramètres indiqués dans le fichier de contrôle pour l'exercice 3. Familiarisez-vous avec les résultats ([ex3_HelpFile.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise3/ex3_HelpFile.pdf)). En plus du score de vraisemblance, vous devez être capable d'identifier les estimations spécifiques à chaque branche pour le paramètre _ω_. (Dans la première exécution, les valeurs spécifiques à chaque branche pour _ω_ seront identiques. Dans les exécutions ultérieures, il y aura des différences entre certaines branches.)

3. Comme dans les exercices précédents, vous devrez _modifier le fichier de contrôle_ et relancer CODEML. Le "guide rapide" du fichier de contrôle peut vous être utile ici ([guide rapide](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise3/ex3_control_file_QuickGuide.pdf)). L'objectif est de calculer la vraisemblance et d'estimer les paramètres _ω_ sous différents modèles de variation de la pression de sélection dans différentes parties de l'arbre. Comme l'information pertinente du modèle se trouve dans le fichier d'arbre, vous devrez spécifier l'un des plusieurs fichiers d'arbre pour chaque analyse, et modifier le fichier de contrôle afin qu'il lise le fichier d'arbre requis.

   * Comme toujours, vous devez _changer_ le nom du fichier de résultats principal (via `outfile=` dans le fichier de contrôle) sinon vous écraserez vos résultats précédents.

   * _Changer_ les hypothèses du modèle concernant les valeurs spécifiques à chaque branche de _ω_ en modifiant les fichiers d'arbre (via `treefile=` et `model=`) définis dans le fichier de contrôle.

4. Répétez l'étape 3 pour chacun des quatre fichiers d'arbre qui vous ont été fournis. Encore une fois, consignez vos résultats en utilisant un tableau semblable à **Table E3** présenté dans les diapositives (voir [ex3 table template.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise3/ex3_table_template.pdf)). De plus, effectuez des tests du rapport de vraisemblance (LRT) pour les hypothèses suivantes. Consultez les notes de cours pour plus de détails sur les LRT. Utilisez 1 degré de liberté pour obtenir la valeur _P_ pour chaque LRT. (Outil utile pour calculer la valeur _P_ : [Calculateur du chi carré](https://homepage.divms.uiowa.edu/%7Embognar/applets/chisq.html))

   * H0 vs. H1  
   * H0 vs. H2  
   * H2 vs. H3

5. Utilisez votre tableau de résultats pour déterminer:

   * _Quel(s) modèle(s) est/sont soutenu(s) par les données?_

   * _Quel scénario biologique est la meilleure explication de l'évolution de la famille de gènes Ldh?_

   * _Existe-t-il des preuves de sélection positive durant l'évolution de Ldh?_

   * _Existe-t-il des scénarios dans lesquels Ldh aurait pu évoluer par sélection positive qui seraient indétectables par ces LRT?_


## Exercice 4
L'objectif de cet exercice est d'utiliser une série de tests du rapport de vraisemblance (LRT) pour _tester les sites_ évoluant sous sélection positive dans le gène nef. Si vous trouvez des preuves significatives de sélection positive, identifiez alors les sites impliqués en utilisant des méthodes Bayésiennes empiriques.

1. Obtenez tous les fichiers pour l'exercice 4 (**ex4_codeml.ctl.txt, ex4_seqfile.txt, treeM0.txt, treeM1.txt, treeM2.txt, treeM3.txt, treeM7.txt, treeM8.txt**). Lorsque vous êtes prêt à lancer CODEML, n'oubliez pas de supprimer le préfixe **ex4_** (le fichier de contrôle doit être nommé **codeml.ctl**).

2. Si vous prévoyez de lancer deux modèles ou plus en même temps, créez un répertoire séparé pour chaque exécution et placez-y une copie du fichier de séquence, ainsi que le fichier de contrôle et le fichier d'arbre requis dans chaque répertoire.

![Models_figure_v2](https://github.com/user-attachments/assets/5158fe8e-3df3-4246-9c42-24c56eacc9e7)

3. Comme dans tous les exercices précédents, vous devrez _modifier le fichier de contrôle_ et relancer CODEML plusieurs fois. Dans ce cas, vous ajusterez six modèles de codons différents (M0, M1a, M2a, M3, M7 et M8) à l'ensemble de données exemple. Le fichier de contrôle "[guide rapide](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise4/ex4_control_file_QuickGuide.pdf)" peut vous être utile ici (guide rapide).

   * Si vous lancez vos analyses de manière séquentielle dans le même répertoire, alors vous devez **changer le nom du fichier de résultats principal** (via `outfile=` dans le fichier de contrôle) sinon vous écraserez vos résultats précédents.

   * Définissez le fichier d'arbre avec `treefile=`. J'ai fourni des fichiers d'arbre préchargés avec les longueurs de branches ML pour chaque modèle (donc vous devez définir un arbre différent pour chaque modèle). Cela accélérera grandement vos analyses, vous offrant plus de "beer time". Consultez le fichier de contrôle exemple pour plus de détails sur les noms des fichiers d'arbre.

   * Définissez le modèle de codons avec `NSsites=`.

   * Fixez la valeur de kappa à l'estimation ML avec `kappa=`. Cela aidera également à accélérer l'analyse. Consultez le fichier de contrôle pour connaître la valeur de kappa pour chaque modèle.

   * Pour certains modèles, vous devrez également définir le nombre de catégories (ncatG) dans la distribution de _ω_:

      * pour M3, définissez `ncatG=3`

      * pour M7, définissez `ncatG=10`

      * pour M8, définissez `ncatG=10`

   * Une fois l'analyse terminée, renommez le fichier rst car les exécutions ultérieures l'écraseront!

   * Répétez les étapes pour chacun des six modèles de codons listés ci-dessus.

4. Consignez vos résultats ([ex4_HelpFile.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise4/ex4_HelpFile.pdf)) en utilisant un tableau semblable à **Table E4** présenté dans les diapositives (voir [ex4 table template.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise4/ex4_table_template.pdf)).

5. De plus, effectuez les tests du rapport de vraisemblance suivants:

   * M0 vs. M3 (4 degrés de liberté)

   * M1a vs. M2a (2 degrés de liberté)

   * M7 vs. M8 (2 degrés de liberté)

6. Enfin, ouvrez le fichier rst généré lors du lancement du modèle M3 ([ex4_rst-HelpFile.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise4/ex4_rst_HelpFile.pdf)). Localisez les colonnes des probabilités a posteriori pour chaque site sous les trois catégories de sites de ce modèle. Utilisez ces données pour produire le graphique pour le gène nef comme celui présenté ci-dessous (_votre graphique sera différent de celui présenté ci-dessous_).

![Posteriors_v3](https://github.com/user-attachments/assets/8d137e0b-2650-44cb-9910-9216e66f37d4)

7. En guise d'étape finale, essayez de synthétiser tous vos résultats et tentez une interprétation biologique du genre que vous souhaiteriez publier dans un véritable article de recherche. Les deux questions générales suivantes devraient vous aider à démarrer. Je vous encourage vivement à réaliser cette dernière étape en collaboration avec d'autres étudiants de l'atelier; discutez-en ensemble!

   * _Quelles conclusions biologiques sont bien étayées par ces données?_

   * _Quels aspects des résultats pouvez-vous interpréter en fonction de vos connaissances biologiques préalables sur ce système, ou sur des systèmes similaires?_

8. OPTIONNEL: Examinez combien de calcul supplémentaire est nécessaire pour estimer les longueurs des branches à partir des données. (Rappel: j'ai fourni des estimations antérieures des MLE pour les longueurs des branches dans le fichier d'arbre!)

   * Relancez le modèle M0 comme précédemment (vous l'avez fait à l'étape 3 ci-dessus), mais cette fois, notez la rapidité avec laquelle le programme s'est terminé.

   * Maintenant, modifiez le fichier de contrôle pour le modèle M0. Définissez `fix_blength = 0`  
     La valeur 0 signifie que les longueurs des branches dans le fichier d'arbre seront ignorées et seront estimées par maximum de vraisemblance.

   * Relancez le modèle M0 avec `fix_blength = 0` et notez le temps nécessaire pour terminer cette exécution.

   * _Quel est l'effet de la taille de l'arbre sur les tests d'hypothèses basés sur le ML?_

   * _Pensez-vous que les longueurs des branches ont un grand impact sur la vraisemblance des données? Qu'en est-il des tests d'hypothèses? Pouvez-vous imaginer une manière d'utiliser `fix_blength = 2` pour vérifier cela?_


## NEXT STEPS...
Maintenant que vous avez une certaine expérience avec les modèles de codons, vous pourriez vouloir essayer un tutoriel sur des sujets plus avancés. Le tutoriel avancé se concentre sur la **détection de l'évolution adaptative épisodique** via "Branch-Site Model A".

![NextSteps_figure](https://github.com/user-attachments/assets/586b16a2-1092-4ec7-8795-ef92129bb0a2)

Le tutoriel inclut également des **activités supplémentaires** concernant:

   * l'identification et l'étiquetage des branches de l'arbre phylogénétique pour l'entrée dans des modèles de codons de site-branche
   * la détection d'instabilités dans vos estimations de paramètres
   * la réalisation d'analyses de robustesse
   * l'utilisation de l'agrégation bootstrap lissée (SBA) pour corriger l'incertitude et l'instabilité des estimations de paramètres dans les modèles de codons

Les protocoles pour chaque activité sont publiés dans _Protocols in Bioinformatics_ (UNIT 6.15). Cette unité présente également des **recommandations pour les "meilleures pratiques" lors de la réalisation d'une enquête évolutive à grande échelle** pour l'évolution adaptative épisodique en utilisant PAML.

Vous pouvez consulter le fichier PDF de _Protocols in Bioinformatics_ UNIT 6.15 ici: [UNIT 6.15](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/resources/UNIT6.15.pdf)

Les fichiers requis pour ce "advanced lab" sont disponibles via ce dépôt Bitbucket: [repository-link](https://bitbucket.org/EvoWorks/protocol-inference-of-episodic-selection/downloads)

