class Player < ActiveRecord::Base
    
    #building relationships
    belongs_to :team
    
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
