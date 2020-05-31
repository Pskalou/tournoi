<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Game\_set\_results\_menu #

**Extends:** [Control](../Control)

## Description ##

Script qui accompagne l'instanciation de la scène `game_set_results_menu.tscn`.

Cette classe met en place l'interface permettant
de modifier les scores tours par tours.

## Functions ##

Type | Name
 --- | --- 
var | func init()
int | func get_round_index() -> int
void | func set_round_index(new_index: int) -> void

## Method Descriptions ##

### init ###

```gdscript
func init()
```

Initialise le tournoi en créant :

* nouveau jeu
* nouveau score
* nouveau boutons du rounds (suppression des anciens et ajout des nouveaux)

### get\_round\_index ###

```gdscript
func get_round_index() -> int
```

Getter qui retourne l'index du round en cours.

### set\_round\_index ###

```gdscript
func set_round_index(new_index: int) -> void
```

Setter qui définit l'index du round en cours.