class User < ActiveRecord::Base
    require 'pry'
    
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
                       # angus parks pete bones
    def trade_players(player, aquiring_player)
        if self.players.include?(player) && !self.players.include?(aquiring_player)
        owners_team_id 4 = player.team_id 4
        player.team_id 6 = aquiring_player.team_id 6
        aquiring player.team_id 4 = owners_team_id 4
        else 
            puts "These players cannot be traded."
        end
    end

    def find_leader_in_stats(stat)
        if stat.downcase == "points"
            Player.all.max_by { |player| player.points }.name
        elsif stat.downcase == "rebounds"
            Player.all.max_by { |player| player.rebounds }.name
        elsif stat.downcase == "assists"
            Player.all.max_by { |player| player.assists }.name
        elsif stat.downcase == "steals"
            Player.all.max_by { |player| player.steals }.name
        else
            puts "please enter a valid stat. \npoints\nrebounds\nassists\nsteals"
        end
    end
end

