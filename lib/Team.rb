class Team < ActiveRecord::Base

    belongs_to :user
    has_many :players

    def self.players
        Player.all.select do |player|
            Player.team_id == self.id
        end
    end


end
