
# Appel à projet


> Proposition de projet dans le cadre du module **Projet Mathématiques et Informatique** du **DU CCIE**.



## Description du projet



Ce projet sera l'occasion de **développer une application**.


## Idée de départ (étude de cas)
L'idée de cette application est partie du problème algorithmique suivant :

Je suis un prof de maths qui motive ses 30 élèves à pratiquer le calcul mental en organisant un **tournoi** au sein d'une classe. Mais je me fixe comme contrainte que **chaque participant affronte tous les autres**.

Pour ma classe de 30 élèves, il faut donc que chaque élève participe à 29 matchs, ce qui fait que je dois gérer **435 matchs** !

Il y a là un problème algorithmique d'**optimisation** mais je suis confiant : puisque je suis prof de math, j'espère bien organiser ces 435 matchs en seulement **29 tours** (je pense pas que l'on puisse faire moins...).



### Objectifs du projet


#### Objectif principal


**1. Créer** l'algorithme ```générer_tournoi```

    Algorithme : générer_tournoi
    Entrée : liste des participants
    Sortie : ensemble de tous les matchs d'un tournoi,
                regroupement des maths par tours,

**2. Optimiser** l'algorithme pour assurer que le nombre de tours est **minimal**

**3.** Développer une application **multi-plateforme**



#### Objectif secondaire

* Enrichir l'application avec des fonctionnalités (cf. Annexe *Carnet de fonctionnalités*)




### Organisation du projet



#### Langage de développement

Pour développer cette application, l'équipe de développement utilisera le *moteur de jeu* **Godot** ([site officiel](https://godotengine.org/) et [page wikipédia](https://fr.wikipedia.org/wiki/Godot_%28moteur_de_jeu%29)).

Ce moteur de jeu possède de nombreux avantages :

* création d'applications **multi-plateformes** (plateformes mobiles (iOS, Android), ordinateur (Windows, macOS, Linux) et web (HTML5 et WebAssembly)
* logiciel libre et gratuit
* plateforme de développement : Linux, Windows, Mac
* programmation de scripts en (au choix) :  Godot Script (équivalent Python), Python, C++, C#, etc. 

Utiliser Godot apportera à l'**équipe de développement** les compétences suivantes :

* découverte pour l'équipe d'un moteur de jeu (par exemple les liens entre interface et scripts)
* outil professionnel utilisé dans l'industrie dujeu (grand studio et **indépendant**)
* très **attractif** pour les élèves



#### Planification et phases de développement


* **Phase 1** (6 semaines)
    * projet : appropriation du problème
    * algo : premiers algorithmes (langage de programmation libre)
    * Godot : installation et découverte Godot : Hello World! + export multi-plateforme
    * interface : premiers schémas/dessins d'interfaces
* **Phase 2** (6 semaines)
    * algo : vérification / optimisation algorithme
    * Godot : transposer l'algorithme sur Godot
    * Godot : création d'un interface
* **Phase 3** (6 semaines)
    * Godot : évolution/correction application (fonctionnalités)
    * Godot : évolution/correction interface



## Annexe


### Carnet de fonctionnalités 

Pour clarifier mes attentes vis à vis de l'application, je propose le carnet de fonctionnalités suivant.
Pour établir cette liste de besoins, je me suis mis à la place de l'**utilisateur** de l'application, du **participant** au tournoi et aussi du **prof** qui utilise cette application dans sa classe.

Cette liste est un idéal **ordonné** mais évidemment non définitif. Des fonctionnalités nouvelles peuvent être **ajoutées**, des fonctionnalités inutiles pourront être **supprimées**.




1. En tant qu'utilisateur, je veux créer des tournois facilement (où tous les participants s'affrontent entre eux), afin de connaître pour chaque tour du tournoi la répartition des participants, match par match
1. En tant qu'utilisateur, je veux utiliser l'application indifféremment sur un ordinateur/tablette/smartphone, afin de pouvoir utiliser l'application en toute circonstances
1. En tant qu'utilisateur, je veux afficher à l'écran le tableau matchs/scores, afin de projeter le tableau et faire suivre les résultats en direct
1. En tant qu'utilisateur, je veux que le tournoi puisse aboutir à un classement entre participants, afin d'atteindre le but du tournoi qui est de définir un ou plusieurs vainqueurs
1. En tant qu'utilisateur, je veux que le score d'un participant soit calculer de façon équitable, afin de ne pas démotiver les plus faibles
1. En tant que participant, je veux connaître à l'issue du tournoi mon score final, afin de m'autoévaluer
1. En tant que participant, je veux comprendre le mode de calcul du score, afin de (1) vérifier le calcul et (2) comprendre comment fonctionne l'application et (3) m'améliorer
1. En tant qu'utilisateur, je veux accéder à l'historique de tous les résultats, afin d'établir un bilan général sur l'application et les tournois
1. En tant que participant, je veux que l'application fonctionne hors connexion (sans wifi par exemple), afin de mettre en place un tournoi sans contrainte de connexion
1. En tant qu'utilisateur, je veux importer facilement la liste de participants, afin de démarrer le plus rapidement possible le premier tour du tournoi
1. En tant qu'utilisateur, je veux importer les identifiants des participants à partir de fichiers aux formats variés (par ex. XLSX, CSV, ODS, XLS, etc.), afin de ne pas avoir à saisir à la main la liste des participants
1. En tant qu'utilisateur, je veux créer un nouveau tournoi à partir d'un tournoi précédents, afin de (1) créer rapidement un tournoi, (2) ne pas avoir à saisir manuellement la liste des participants
1. En tant qu'utilisateur, je veux regrouper en différents groupes les participants à des tournois précédents, afin de (1) saisir facilement les groupes, (2) proposer aux profs de gérer des classes, (3) créer des groupes de niveaux
1. En tant qu'utilisateur, je veux modifier la liste des participants d'un tournoi en direct, afin de (1) mettre à jour une liste importée, (2) ajouter des participants absents (3) supprimer (temporairement) un participant absent
1. En tant qu'utilisateur, je veux importer les identifiants des participants par copier/coller, afin de personnaliser le tableau d'affichage maths/scores
1. En tant qu'utilisateur, je veux récupérer/exporter les scores du tournoi, afin de pouvoir exploiter de façon personnalisée les résultats
1. En tant qu'utilisateur, je veux créer un tournoi facilement (regrouper les participants par poules pour qualifier les finalistes), afin de (1) gérer un trop grand nombre de participant (trop de matchs), (2) gérer des groupes de niveaux hétérogènes
1. En tant que participant, je veux générer des diplômes du tournoi pour les participants, afin de féliciter les participants : (1) bien classés, (2) motivés mais pas forcément avec un bon score, (3) qui ne lâches rien mais par forcément avec un bon score
1. En tant que participant, je veux obtenir mon diplôme sur le tournoi auquel j'ai participé, afin de (1) me motiver, (2) me féliciter du travail accompli
1. En tant qu'utilisateur, je veux exporter les diplômes des participants au format PDF, afin de (1) pouvoir imprimer les diplômes (2) féliciter les participants
1. En tant qu'utilisateur, je veux pouvoir personnaliser les diplômes, afin de (1) m'adapter au tournoi et aux regroupements de participants et (2) motiver les participants
1. En tant qu'utilisateur, je veux gérer l'historique des tournois, afin de (1) créer à posteriori des regroupements de tournois et (2) obtenir un classement à partir de différents tournois
1. En tant qu'utilisateur, je veux que le score obtenu puisse dépendre de l'historique des tournois précédents, afin de proposer des tournois motivants avec de l'enjeu
1. En tant qu'utilisateur, je veux avoir un bilan par participant et par groupe sur l'évolution des scores entre les tournois, afin d'établir un bilan sur le groupe
1. En tant qu'utilisateur, je veux pouvoir obtenir un score (classement ?) par participant sur l'ensemble des tournois auquels ils ont participé, afin de motiver les participants sur la durée
1. En tant que prof, je veux pouvoir évaluer les participants par compétences, afin d'intégrer la pratique du tournoi avec les recommandations et presrciptions du BO
1. En tant qu'utilisateur, je veux partager facilement les scores d'un tournoi avec les participants, afin de donner accès à l'historique du tournoi aux participants (sans oublier d'anonymer les identifiants RGPD)
1. En tant qu'utilisateur, je veux partager facilement les scores de tous les tournois avec les participants, afin de (1) donner accès à l'historique des tournois aux participants (sans oublier d'anonymer les identifiants RGPD) (2) établir un classement international entre les pays du monde !
1. En tant qu'utilisateur chinois, je souhaite utiliser l'application afin de créer des tournois de millions de personnes.

