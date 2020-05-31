<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Round\_buttons #

## Description ##

Cette classe a en charge la création et la gestion les boutons de duels.
Elle fait le lien entre les clics et le score.

## Functions ##

Type | Name
 --- | --- 
var | func kill()
Array | func build(round_index: int, current_node: Node) -> Array

## Method Descriptions ##

### kill ###

```gdscript
func kill()
```

Fonction utilisée pour vider le tableau d'objets.
Supprime tous les anciens boutons.

### build ###

```gdscript
func build(round_index: int, current_node: Node) -> Array
```

Crée l'ensemble des boutons pour un round donné

entrée :

* round_index : le round concerné
* current_node: le node dans lequel on va instancier les boutons

sortie :

* tableau de tous les boutons