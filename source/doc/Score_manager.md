<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Score\_manager #

## Description ##

Cette classe gère l'état du tournoi actuel.
Dans un second temps, l'état est converti en score.

## Properties ##

Type | Name
 --- | --- 
int | win_points
int | lose_points
int | no_point

## Functions ##

Type | Name
 --- | --- 
bool | func exist_result(id1: int, id2: int) -> bool
void | func set_result(player_id: int, opponent_id: int, state: int) -> void
int | func get_result(player_id: int, opponent_id: int) -> int
String | func score_en_bbcode(little = false) -> String

## Property Descriptions ##

### win\_points ###

```gdscript
var win_points: int = 10
```

Barême pour une victoire.
Par défaut égal à 10

TODO : privatiser la propriété (set/get)

### lose\_points ###

```gdscript
var lose_points: int = 5
```

Barême pour une défaite.
Par défaut égal à 5 car nous souhaitons valoriser la participation à un match.

TODO : privatiser la propriété (set/get)

### no\_point ###

```gdscript
var no_point: int = 0
```

Barême pour une absence de math.
Par défaut égal à 0.

TODO : privatiser la propriété (set/get)

## Method Descriptions ##

### exist\_result ###

```gdscript
func exist_result(id1: int, id2: int) -> bool
```

Cette méthode permet de savoir si un match a eu lieu.
Retourne vrai si les joueurs id1 et id2 se sont affrontés

### set\_result ###

```gdscript
func set_result(player_id: int, opponent_id: int, state: int) -> void
```

Défini l'état d'un match entre player_id et son adversaire opponent_id.

* state : 0 => non joué
* state : 1 => player_id gagne
* state : 2 => player_id perd

TODO : les états 0/1/2 doivent être internes à la classe.
Les autres classes n'ont pas à connaître ce fonctionnement.

### get\_result ###

```gdscript
func get_result(player_id: int, opponent_id: int) -> int
```

Retourne l'état d'un match entre player_id et son adversaire opponent_id.

* retourne : 0 => non joué
* retourne : 1 => player gagne
* retourne : 2 => player perd

TODO : les états 0/1/2 doivent être internes à la classe.
TODO : utiliser des prédicats ? retourner uniquement les scores  ?

### score\_en\_bbcode ###

```gdscript
func score_en_bbcode(little = false) -> String
```

Retourne le tableau des scores sous la forme d'un texte
au format BBcode

Cette fonction transforme le tableau des états (0, 1 ou 2)
en texte de score en fonction du barême par défaut.
* little= true  pour un tableau avec uniquement le total
* little= false pour un tableau détaillé

TODO : rendre le barême par défaut modifiable (menu option)