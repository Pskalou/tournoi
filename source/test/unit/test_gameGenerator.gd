extends 'res://addons/gut/test.gd'




class Test_correction_gameGenerator:
    extends 'res://addons/gut/test.gd'

    func _id0_nplayers(n_players):
        # détermination aléatoire du nombre d'adversaire
        var n_rounds= n_players - 1

        Global.set_total_players(n_players)
        var game= Game_generator.new()

        # adversaires du joueur 0
        var opponents= []
        for i in range(1,n_players):
            opponents.append(i)
        print(opponents)
        
        # vérification que tous les adversaires sont dans le tableau
        for i in range(0,n_rounds):
            var id_adversaire= game.opponent(0,i)
            opponents.erase(id_adversaire)
        
        # vérification que la tableau est bien vide
        # ie. chaque adversaire n'y était qu'une seule fois
        return opponents == []

    # test que le joueur 0 affronte une et une seule fois
    # chacun des autres joueurs
    func test_opponent_player0_vs_all_others():

        var n_players
        
        # 10 tests aléatoires
        for i in range(10):
            n_players= randi() % 500
            assert_true(_id0_nplayers(n_players))





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
        Global.set_total_players(10)
        game= Game_generator.new()
        assert_true(game._total_players == 10)
        assert_true(game._total_rounds == 9)

    func test_opponent_of_player0_at_round_0_is_player1():
        Global.set_total_players(6)
        var game= Game_generator.new()
        # par défaut, l'adversaire de 0 au round 0 est le joueur 1
        assert_true(game.opponent(0,0) == 1)
    



