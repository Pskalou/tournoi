# Générateur automatique de doc

La documentation est actuellement disponible et parfaitement lisible sur le github

* [https://github.com/Pskalou/tournoi/tree/master/source/doc](https://github.com/Pskalou/tournoi/tree/master/source/doc)



## Principe

Afin de générer la documentation automatiquement, nous avons installé l'outil `gdscript-docs-maker` :


* [https://github.com/GDQuest/gdscript-docs-maker](https://github.com/GDQuest/gdscript-docs-maker)


Méthode générale :

* Cloner le dépôt du plugin
* Se rendre dans le dossier `gdscript-docs-maker`
* Exécuter la commande `./generate\_reference dossier_source dossier_cible`

Nous avons adapté cette méthode et avons créé le script [`myScript.sh`](https://github.com/Pskalou/tournoi/blob/master/gdscript-docs-maker/myScript.sh) à exécuter sans argument.



## Ajout de la documentation dans le code source


La documentation est générée à partir de commentaires ajouté *avant* la déclaration des classes, méthodes et attributs.


### Exemple

Voici le début de la classe `Score_manager.gd` qui permet, après exécution du script, de générer le fichier [Score_manager.md](https://github.com/Pskalou/tournoi/blob/master/source/doc/Score_manager.md).


    # Cette classe gère l'état du tournoi actuel. 
    # Dans un second temps, l'état est converti en score.
    class_name Score_manager
    
    
    # Barême pour une victoire.
    # Par défaut égal à 10
    #
    # TODO : privatiser la propriété (set/get)
    var win_points	:int= 10


