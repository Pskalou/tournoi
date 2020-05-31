<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Game\_generator #

## Description ##

Cette classe à en charge la gestion de la répartition des matchs.

Pour chaque tour, l'algorithme génère la liste des matchs.

En notant n le nombre de participant, le modèle de donné utilisé est une matrice carrée M de dimension n.
Pour deux participants d'identifiants les nombres entiers i et ,
M(i,j) est égal au tour durant lequel les participants i et j se rencontrent.

## Functions ##

Type | Name
 --- | --- 
int | func opponent(player_id: int, round_index: int) -> int

## Method Descriptions ##

### opponent ###

```gdscript
func opponent(player_id: int, round_index: int) -> int
```

Retourne l'identifiant de l'adversaire de 'player_id' lors du tour 'round_index'.
S'il n'y a pas d'adversaire (tour impair par exemple), la méthode retourne -1.