require_relative '../config/environment'
require 'require_all'
require_all('lib')

def start
    puts 'Welcome to Basketball Simulator!'
    puts "What's your user name?"
    user_name = gets.chomp
    puts "So your name is #{user_name}? Is that Correct? (Y/N) or any other key to exit"
    name_resp = gets.chomp.upcase

    if name_resp == 'Y'
        puts "Wow what a great name"
        puts "What is your age?"
        age = gets.chomp
        puts "So your name is #{user_name} and your age is #{age}? Is that Correct? (Y/N) or any other key to exit"
        name_age_resp = gets.chomp.upcase
        if name_age_resp == "Y"
           user = User.find_or_create_by(name: user_name, age: age)
        elsif name_age_resp == "N"
            start
        else
            puts "Thanks for playing"
        end
    elsif name_resp == "N"
        start
    else
        puts "Thanks for playing"
    end
    user
end

def team_creator(user)
    puts "Are you ready to customize your team? (Y/N) enter any other key to exit."
    start_customize_resp = gets.chomp.upcase
    if start_customize_resp == 'Y'
        puts "What city are you from?"
        city_resp = gets.chomp
        puts "Make a mascot"
        mascot_resp = gets.chomp
        puts "Choose your teams color"
        color_resp = gets.chomp

        team = Team.find_or_create_by(city: city_resp, mascot: mascot_resp, color: color_resp, user_id: user.id)
        
    elsif start_customize_resp == 'N'
        team_creator(user)
    else
        puts "Thanks for playing"
    end
    team
end

def pick_players(team)
    puts "Now you will pick your players are you ready? (Y/N) enter any other key to exit."
    start_pick_resp = gets.chomp.upcase
    if start_pick_resp == "N"
        pick_players(team)
    elsif start_pick_resp == 'Y'
        players_on_team = []
        counter = 1
        puts "Here is the list of players to choose from, please select the number associated with the player."
        Player.player_list
        while counter < 4
            puts "Choose your player #{counter}"
            player_choice_1 = gets.chomp
            player1 = player_choice_1.to_i
            final_player = Player.find_player_by_index(player1)
            while players_on_team.include?(final_player)
                puts "please select a different player #{counter}."
                player_choice_1 = gets.chomp
                player1 = player_choice_1.to_i
                final_player = Player.find_player_by_index(player1)   
            end
            players_on_team << final_player
            counter += 1
        end 
          
    end  
    reassign_team_id(players_on_team, team)
    puts "These are your players"
    find_players_names(players_on_team)
    end
 
    def fun_stuff(user, boss)
        puts "Are you ready to see how well you did? (Y/N?)"
        all_stats_resp = gets.chomp.upcase
        if all_stats_resp == "Y"
            user.all_stats
        else
            puts "lets continue"
        end
        puts "Do you think you can defeat THE final boss? (Y/N)"
        final_boss_response = gets.chomp.upcase
        if final_boss_response == "Y"
            puts "This world is full of things that don't go as you wish."
                    #final boss time
        else
            puts "You’ll have the rest of your entire life to brood over this defeat"
                    #final boss time
        end
         "would you like to see the leading players in a stat? (Y/N?)"
        stat_resp = gets.chomp.upcase
        if stat_resp == "Y"
            puts "What stat would you like to see the leader in? Please select from:\nPoints:\nRebounds:\nAssists:\nSteals:"
            stat = gets.chomp.downcase
            if stat == "points" || stat == "rebounds" || stat == "assists" || stat == "steals"
                user.find_leader_in_stats(stat)
            else
                puts "let's continue"
            end
        end
        
    end

def run
    user = start
    team = team_creator(user)
    players = pick_players(team)
    boss = User.find_by(name: "Boss")
    
    fun_stuff(user, boss)
    

end


run


