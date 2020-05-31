extends 'res://addons/gut/test.gd'
# lancer les tests à partir de VSCode et de l'extension Godot/GUT


class Test_Creation_de_classe:
    extends 'res://addons/gut/test.gd'

    func test_creation_6_joueurs_par_defaut():
        Global.set_total_players(6)
        var game= Game_generator.new()
        # par défaut, il y a 6 joueurs
        assert_true(game._total_players == 6)


    func test_creation_5_rounds_par_defaut():
        Global.set_total_players(6)
        var game= Game_generator.new()
        # par défaut, il y a 5 rounds
        assert_true(game._total_rounds == 5)
    
    func test_reinitialisation():
        var game= Game_generator.new()
        Global.set_total_players(9)
        game= Game_generator.new()
        assert_true(game._total_players == 9)
        assert_true(game._total_rounds == 8)

    func test_opponent_of_player0_at_round_0_is_player1():
        Global.set_total_players(6)
        var game= Game_generator.new()
        # par défaut, l'adversaire de 0 au round 0 est le joueur 1
        assert_true(game.opponent(0,0) == 1)


    
class Test_correction_gameGenerator:
    extends 'res://addons/gut/test.gd'

    # choix d'un identifiant (id) puis 10 tests successifs :
    #    * un tournoi de taille qcq inférieure à 250 participants
    #    => vérification que le participant (id) affronte
    #       tous les autres participants une seule fois.
    func test_10_tournois_corrects_pour_un_unique_id():
        # borne sup du nb de participant (trop long sinon)
        var maxi= 250
        var player_id= 1+ (randi() % maxi)
        var n_players
        # 10 tests aléatoires
        for _i in range(10):
            n_players= player_id + randi() % (maxi - player_id) + 1
            assert_true(_idX_nplayers(player_id, n_players))

    # 10 tests successifs :
    #    * un participant quelconque (id aléatoire)
    #    * un tournoi de taille qcq inférieure à 250 participants
    #    => vérification que le participant affronte
    #       tous les autres participants une seule fois.
    func test_10_tournois_corrects_pour_idX():
        # borne sup du nb de participant (trop long sinon)
        var maxi= 250
        var n_players
        var player_id
        # 10 tests aléatoires
        for _i in range(10):
            n_players= 2+randi() % maxi
            player_id= randi() % n_players
            assert_true(_idX_nplayers(player_id,n_players))
    
    # Cette fonction teste qu'un participant affronte bien
    # tous les autres adversaires lors d'un tournoi. 
    # 
    #    * player_id : numéro du participant à tester
    #    * n_player  : nombre de participants au tournoi
    func _idX_nplayers(player_id, n_players):
        # créatio du tournoi
        Global.set_total_players(n_players)
        var game= Game_generator.new()
        var n_rounds= game._total_rounds

        # liste de tous les participants sauf player_id
        var opponents= []
        for _i in range(0,n_players):
            opponents.append(_i)
        opponents.erase(player_id)

        # parcours du tableau généré par l'algo du tournoi
        # et suppression, round par round, de tous les adversaires rencontrés
        for _i in range(0,n_players + n_players%2 - 1):
            var id_adversaire= game.opponent(player_id,_i)
            # s'il y a un adversaire alors enlève le du tableau opponent
            if id_adversaire != -1:
                opponents.erase(id_adversaire)
        
        # retourner le tableau des adversaires
        #
        # et si tout va bien, cette liste sera bien vide
        # (ie. chaque adversaire n'y était qu'une seule fois)
        return opponents == []

