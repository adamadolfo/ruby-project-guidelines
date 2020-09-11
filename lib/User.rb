class User < ActiveRecord::Base
    require 'pry'
    
    has_many :teams
    has_many :players, through: :teams

    def final_battle(user, boss)
        array = []
          x = boss.find_boss_points(boss) >= user.team_total_points_stats
            array << x
            y = boss.find_boss_rebounds(boss) >= user.team_total_rebounds_stats
             array << y
             z = boss.find_boss_assists(boss) >= user.team_total_assist_stats
            array << z
             n = boss.find_boss_steals(boss) >= user.team_total_steals_stats
             array << n
        if array.count(false) >= 3
            puts "WOW I CAN'T BELIEVE YOU WON! NO ONE ELSE COULD BEAT THE BOSS! YOU ARE THE COOLEST!"
        else 
            puts "THE Boss: 'welcome to the end of your life. And I promise it's going to hurt'"
        end
    end


    def find_boss_points(boss)
        points_total = 0
        boss.players.map do |player|
            points_total += player.points
        end
        points_total
    end
    def find_boss_rebounds(boss)
        rebounds_total = 0
        boss.players.map do |player|
            rebounds_total += player.rebounds
        end
        rebounds_total
    end
    def find_boss_assists(boss)
        points_total = 0
        boss.players.map do |player|
            points_total += player.assists
        end
        points_total
    end
    def find_boss_steals(boss)
        points_total = 0
        boss.players.map do |player|
            points_total += player.steals
        end
        points_total
    end
    def boss_stats(boss)
        puts "The Boss's total points are: #{find_boss_points(boss)}"
        puts "The Boss's total rebounds are: #{find_boss_rebounds(boss)}"
        puts "The Boss's total assists are: #{find_boss_assists(boss)}"
        puts "The Boss's total steals are: #{find_boss_steals(boss)}"
    end



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
        owners_team_id = player.team_id 
        player.team_id = aquiring_player.team_id 
        aquiring player.team_id = owners_team_id 
        else 
            puts "These players cannot be traded."
        end
    end

    def find_leader_in_stats(stat)
        if stat.downcase == "points"
           puts Player.all.max_by { |player| player.points }.name
        elsif stat.downcase == "rebounds"
           puts Player.all.max_by { |player| player.rebounds }.name
        elsif stat.downcase == "assists"
           puts Player.all.max_by { |player| player.assists }.name
        elsif stat.downcase == "steals"
           puts Player.all.max_by { |player| player.steals }.name
        else
            puts "please enter a valid stat. \npoints\nrebounds\nassists\nsteals"
        end
    end
end

