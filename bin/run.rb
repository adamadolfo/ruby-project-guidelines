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

        team = Team.find_or_create_by(city: city_resp, mascot: mascot_resp, color: color_resp, user_id: user)
        
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
        puts "Here is the list of players to choose from, please select the number associated with the player."
        Player.player_list
            puts "Choose your first player"
            player_choice_1 = gets.chomp
            players_on_team << player_choice_1
            puts "Choose another player"
            player_choice_2 = gets.chomp
            if players_on_team.include?(player_choice_2)
                puts "please select a different player."
                pick_players(team)
            else
                players_on_team << player_choice_2
            end
            puts "Choose your final player"
            player_choice_3 = gets.chomp
            if players_on_team.include?(player_choice_3)
                puts "please select a different player."
                pick_players(team)
            else
                players_on_team << player_choice_3
            end
            player1 = players_on_team[0].to_i
            player2 = players_on_team[1].to_i
            player3 = players_on_team[2].to_i
            final_player1 = Player.find_player_by_index(player1)
            final_player2 = Player.find_player_by_index(player2)
            final_player3 = Player.find_player_by_index(player3)
            
        end 
        final_player1.team_id = team
        puts "Here is your team!"
        puts final_player1.name , final_player2.name, final_player3.name
    end


            
            #     if player_choice_3 == player_choice_2 && player_choice_3 == player_choice_1
            #         puts "Please choose different player."
            #     elsif
            #         puts "Your team is complete"
            #     end

   
            








# def create_user(name)
#     current_user = User.find_or_create_by(name: name)
#     players = Player.all 

#     puts 'Choose a player to add to your team (by number'
#     players.each {|player, index|
#         puts "#{index + 1}: #{player}"
#     }
#     player_resp = gets.chomp 

#     selected_player = players[player_resp - 1]

# end
def run
    user = start
    team = team_creator(user)
    players = pick_players(team)

end

run





