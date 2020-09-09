class User < ActiveRecord::Base
    
    has_many :teams
    has_many :players, through: :teams

    def self.teams
        Team.all.select do |team|
            Team.user_id == self.id
        end
    end

    def players
        self.teams.map do |team|
            team.players
        end
    end

    # Moveing_players --> change a players team_id to another


end
