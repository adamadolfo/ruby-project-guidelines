class Player < ActiveRecord::Base
    
    #building relationships
    belongs_to :team


    def self.player_list
        Player.all.each_with_index do |player, index|
            # binding.pry
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
