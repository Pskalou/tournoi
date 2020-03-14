<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Duel\_button #

**Extends:** [TextureButton](../TextureButton)

## Description ##

Classe associée à la scène `duel_button.tscn`.

Affiche 2 boutons associés à 2 adversaires : le _player_id et son _opponent_id.
Un clic sur les boutons modifie l'état du match (`_state`) en fonction de la victoire, défaite ou non joué.

L'information se transmet via les signaux.

## Functions ##

Type | Name
 --- | --- 
void | func set_state(new_state: int) -> void
void | func initialisation(player_id: int, opponent_id: int) -> void

## Signals ##

- signal is_pressed(): 

## Method Descriptions ##

### set\_state ###

```gdscript
func set_state(new_state: int) -> void
```

Défini le nouvel état dans le match opposant player_id et opponent_id.

* 0 : non joué
* 1 : player_id gagne
* 2 : player_id perd

### initialisation ###

```gdscript
func initialisation(player_id: int, opponent_id: int) -> void
```

Initialise l'instance de duel_button avec les identifiants :

* player_id : joueur de référence
* opponent_id : adversaire

