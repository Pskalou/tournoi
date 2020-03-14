# Générateur automatique de doc

La documentation est actuellement disponible sur le github : https://github.com/Pskalou/tournoi/tree/master/source/doc




## Principe


La documentation est générée à partir de commentaires ajouté *avant* la déclaration des classes, méthodes et attributs.

Par exemple, voici le début de la classe `Score_manager.gd`

    # Cette classe gère l'état du tournoi actuel. 
    # Dans un second temps, l'état est converti en score.
    class_name Score_manager
    
    
    # Barême pour une victoire.
    # Par défaut égal à 10
    #
    # TODO : privatiser la propriété (set/get)
    var win_points	:int= 10


Qui permet de générer le fichier [https://github.com/Pskalou/tournoi/blob/master/source/doc/Score_manager.md](https://github.com/Pskalou/tournoi/blob/master/source/doc/Score_manager.md)

## How To

Nous avons installé le plugin gdscript-docs-maker

* https://github.com/GDQuest/gdscript-docs-maker



Sous `bash`, il faut se rendre dans le dossier `gdscript-docs-maker`.
Puis lancer la commande `./generate_reference ./../source/ ./../source/doc/`.
Les fichiers générés seront déplacés dans le dossier `source/doc`.

