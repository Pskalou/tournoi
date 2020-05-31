<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Global\_ #

**Extends:** [Node](../Node)

## Description ##

La Classe globale chargée automatiquement lors du lancement de l'application.
Elle stocke les informations essentielles et nécessaires à toutes les classes.

Cette classe est globale et utilise le principe Singleton de Godot.
(cf menu `Projet > Paramètres du projet... > Autoload` et cocher le design pattern "*Singleton*")

Le nom *GlobalClass* est utilisé uniquement pour générer la doc

## Properties ##

Type | Name
 --- | --- 
bool | is_saved
Game_generator | game
Score_manager | score
Round_buttons | round_buttons
Array | round_buttons_list
MarginContainer | main
var | accueil_menu
var | new_match_menu
var | game_set_results_menu
var | results_menu

## Functions ##

Type | Name
 --- | --- 
void | func set_total_players(nombre_de_joueurs: int) -> void
int | func get_total_players() -> int
void | func button_hover(button: TextureButton) -> void
var | func button_init(button)

## Signals ##

- signal actualise_affichage(): Actualiser l'affichage du tableau des scores

## Property Descriptions ##

### is\_saved ###

```gdscript
var is_saved: bool = true
```

Cet attribut indique si le tournoi a été modifié depuis la dernière sauvegarde.
Si un risque de perdre les résultats en cours, une fenêtre modale  apparaît
et demande si on est sûr d'être certain.

Valeur par défaut : True

### game ###

```gdscript
var game: Game_generator
```

L'attribut *game* référence une instance de `GameGenerator`.
C'est le moyen de déterminer l'`adversaire_id` en fonction du `round` et de `player_id`.

### score ###

```gdscript
var score: Score_manager
```

L'attribut `score` référence une instance de **ScoreManager**
C'est la classe dédiée à la gestion du score.

### round\_buttons ###

```gdscript
var round_buttons: Round_buttons
```

L'attribut `round_button` référence une instance de `Round_buttons` :

* contient et gère les `duel_boutons` (pour chaque round)
* modifie l'état instantané du tournoi en fonction des clics
* est détruite (queue_free) puis réinstanciée pour chaque roud

### round\_buttons\_list ###

```gdscript
var round_buttons_list: Array
```

Tableau de `int` qui contient, pour un tour donné, la liste des `duel_boutons`.

### main ###

```gdscript
var main: MarginContainer
```

Node racine de l'application. Ce node va contenir toute les scènes de l'application.

### accueil\_menu ###

```gdscript
var accueil_menu
```

Instance de la scène menu d'accueil de l'application. Visible ou pas en fonction de l'interface souhaitée.

### new\_match\_menu ###

```gdscript
var new_match_menu
```

Instance de la scène menu de configuration d'un nouveau tournoi. Visible ou pas en fonction de l'interface souhaitée.

### game\_set\_results\_menu ###

```gdscript
var game_set_results_menu
```

Instance de la scène qui affiche le tournoi, les boutons et le score en direct.
Visible ou pas en fonction de l'interface souhaitée.

### results\_menu ###

```gdscript
var results_menu
```

résultats

## Method Descriptions ##

### set\_total\_players ###

```gdscript
func set_total_players(nombre_de_joueurs: int) -> void
```

Setter pour définir le nombre de joueurs dans le tournoi actuel.

### get\_total\_players ###

```gdscript
func get_total_players() -> int
```

Getter qui retourne le nombre de joueurs dans le tournoi actuel.

### button\_hover ###

```gdscript
func button_hover(button: TextureButton) -> void
```

Méthode pour définir et homogénéiser l'ensemble des changement de style
à appliquer lors du **survol d'un bouton** de type TextureButton.

### button\_init ###

```gdscript
func button_init(button)
```

Méthode pour définir et homogénéiser l'ensemble des changement de style
à appliquer pour réinitialiser le bouton de type TextureButton (après un survol de la souris).