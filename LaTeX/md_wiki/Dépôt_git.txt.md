# Dépôt git

* Pour **consulter** le dépôt de fichier : [c'est ici](https://pp.irem.univ-mrs.fr/projects/application-tournoi/repository) sur le Redmine (cf onglet **Dépôt**).
* Pour **modifier** les fichiers du dépôt : [c'est sur Github](https://github.com/Pskalou/tournoi) (en effet, pour des questions de sécurité, l'hébergement du Redmine ne permet pas l'écriture sur le serveur très simplement).



# Github

Sources d'information :

* [Tutoriel (anglais) - comment collaborer avec github](https://code.tutsplus.com/tutorials/how-to-collaborate-on-github--net-34267)
* [Page Wikipedia - Git](https://fr.wikipedia.org/wiki/Git)
* [Page Wikipedia - GitHub](https://fr.wikipedia.org/wiki/GitHub)

Pour travailler à plusieurs sur les *mêmes fichiers*, il semble indispensable d'utiliser un système de *dépôt de fichiers*. Cette technologie permet d'avoir l'historique de modification de tous les fichiers et de synchroniser les fichiers entre tous les utilisateurs.

## Pour synchroniser (pull)

1. mettre les fichiers sur le serveur collectif **github** : https://github.com/Pskalou/tournoi
1. mettre en place la synchronisation d'un dossier de son ordinateur avec le dépôt : `git clone https://github.com/Pskalou/tournoi`
1. vérifier les mises à jour : `git fetch`
1. récupérer les mises à jour : `git pull`

## Pour publier (push)

1. posséder un compte github
1. ajouter le compte github au projet
1. vérifier les mises à jours `git fetch` et les récupérer `git pull`
1. envoyer ses propres mises à jour : `git push`

