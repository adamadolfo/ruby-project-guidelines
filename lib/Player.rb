class Player < ActiveRecord::Base
    
    #building relationships
    belongs_to :team
    

    def find_players_names(array)
        array.each do |element|
           puts element.name
        end
    end

    def self.find_player_by_index(int)
        Player.all[int - 1] 
    end

    ##make a new column boss t/f make an array of all players that are f 
    ##subsitute player.all for new array

    # def self.list_of_boss
    #     Player.all.select do |player|
    #         player.is_boss
    #     end
    # end

    def self.list_of_available_p
        Player.all.select do |player|
            !player.is_boss
        end
    end


    def self.player_list
        self.list_of_available_p.each_with_index do |player, index|
            puts "#{index + 1}: #{player.name}"
        end

    end

    # def create_user(name)
        #     current_user = User.find_or_create_by(name: name)
        #     players = Player.all 
        
        #     puts 'Choose a player to add to your team (by number'
        #     players.each {|player, index|
        #         puts "#{index + 1}: #{player}"
        #     }
        #     player_resp = gets.chomp 
        
        #     selected_player = players[player_resp - 1]
    
    # def self.play_game
    #     # # create a random number generator for each stat
    #     # point_rand = rand(31)
    #     # rebound_rand = rand(13)
    #     # assist_rand = rand(15)
    #     # steal_rand = rand(9)
    #     # # add that random number to each stat of a player
    #     # self.all do |player|
    #     #     player.points += point_rand
    #     #     player.rebounds += rebound_rand
    #     #     player.assist += assist_rand
    #     #     player.steal += steal_rand
    #     # end
    # end


end
def find_players_names(array)
    array.each do |element|
       puts element.name
    end
end

def reassign_team_id(array, team)
    array.map do |element|
        element.update(team_id: team.id)
    end
end
