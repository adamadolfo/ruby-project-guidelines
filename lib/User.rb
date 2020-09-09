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
        end.flatten
    end

    def team_total_points_stats
        points_total = 0
        self.players.map do |player|
            points_total += player.points
        end
        points_total
    end

    def team_total_rebounds_stats
        rebound_total = 0
        self.players.map do |player|
            rebound_total += player.rebounds
        end
        rebound_total
    end

    def team_total_assist_stats
        assist_total = 0
        self.players.map do |player|
            assist_total += player.assists
        end
        assist_total
    end

    def team_total_steals_stats
        steal_total = 0
        self.players.map do |player|
            steal_total += player.steals
        end
        steal_total
    end

    def all_stats
        puts "Your team's total points are: #{team_total_points_stats}"
        puts "Your team's total rebounds are: #{team_total_rebounds_stats}"
        puts "Your team's total assists are: #{team_total_assist_stats}"
        puts "Your team's total steals are: #{team_total_steals_stats}"
    end

    # Moveing_players --> change a players team_id to another 
    #                     by looking at team_id and reasigning 
    # def add_players(player)
    #     if self.players.include?(player)
    #         puts "You already have this player!"
    #     else
    #         self.players.push(player)
    #         player.all.find do |p|
    #             p == player
    #         end.team_id = self.id
    #     end
    # end



end
