Player.destroy_all
Team.destroy_all
User.destroy_all

adam = User.find_or_create_by(name: "Adam Adolfo", age: 24)
ahmed = User.find_or_create_by(name: "Ahmed Abboud", age: 31)
james = User.find_or_create_by(name: "James the Giant", age: 35)
victoria = User.find_or_create_by(name: "Vicy the vixen", age: 21)
kim = User.find_or_create_by(name: "Kimbo Slice", age: 41)
karim = User.find_or_create_by(name: "Karim", age: 18)

# city, mascot, color, UserID
kaptains = Team.find_or_create_by(city: "San Fransisco", mascot: "Kaptains", color: "Gold", user_id: kim.id)
dealers = Team.find_or_create_by(city: "Miami", mascot: "Dealers", color: "Green", user_id: james.id)
iron_ogres = Team.find_or_create_by(city: "Pittsburgh", mascot: "Iron Ogres", color: "Silver", user_id: victoria.id)
blue_eyes = Team.find_or_create_by(city: "Domino City", mascot: "Blue-Eyes", color: "White", user_id: adam.id)
monarchs = Team.find_or_create_by(city: "London", mascot: "Monarchs", color: "Royal Purple", user_id: karim.id)
scarfaces = Team.find_or_create_by(city: "Montana", mascot: "Scarfaces", color: "Blood Red", user_id: ahmed.id)

# name, number:, position:, points:, rebounds:, assists:, steals: team:

frederickKaiser = Player.find_or_create_by(name: "Frederick Kaiser", number: 1, position: "G", points: 32, rebounds: 5, assists: 1, steals: 4, team_id: nil)
nabeelSparks  = Player.find_or_create_by(name: "Nabeel Sparks", number: 2, position: "F", points: 22, rebounds: 4, assists: 5, steals: 1, team_id: nil)
raidenDalton  = Player.find_or_create_by(name: "Raiden Dalton", number: 3, position: "C", points: 3, rebounds: 5, assists: 20, steals: 6, team_id: nil)
elmerYoder  = Player.find_or_create_by(name: "Elmer Yoder",number: 4, position: "C", points: 25, rebounds: 3, assists: 2, steals: 6, team_id: nil)
denzelColes  = Player.find_or_create_by(name: "Denzel Coles",number: 5, position: "G", points: 16, rebounds: 16, assists: 6, steals: 1, team_id: nil)
kingaKing  = Player.find_or_create_by(name: "Kinga King",number: 6, position: "F", points: 16, rebounds: 6, assists: 6, steals: 2, team_id: nil)
kaiserJackson  = Player.find_or_create_by(name: "Kaiser Jackson",number: 7, position:  "F", points: 39, rebounds: 3, assists: 2, steals: 1, team_id: nil)
montyWhitehouse  = Player.find_or_create_by(name: "Monty Whitehouse",number: 8, position: "G", points: 31, rebounds: 6, assists: 7, steals: 2, team_id: nil)
arbaazBurton  = Player.find_or_create_by(name: "Arbaaz Burton",number: 9, position: "C", points:  37, rebounds: 11, assists: 2, steals: 0, team_id: nil)
angusParks  = Player.find_or_create_by(name: "Angus Parks",number: 10, position: "G", points:  20, rebounds: 5, assists: 2, steals: 9, team_id: nil)
zakirWhiteley  = Player.find_or_create_by(name: "Zakir Whiteley", number: 11, position: "C", points: 10, rebounds: 10, assists: 1, steals: 0, team_id: nil)
garfieldHowarth  = Player.find_or_create_by(name: "Garfield Howarth",number: 12, position: "F", points: 23, rebounds: 4, assists: 4, steals: 2, team_id: nil)
devTraynor  = Player.find_or_create_by(name: "Dev Traynor",number: 13, position: "C", points: 1, rebounds: 20, assists: 0, steals: 0, team_id: nil)
johnOrtiz  = Player.find_or_create_by(name: "John Ortiz",number: 14, position: "G", points: 27, rebounds: 0, assists: 10, steals: 4, team_id: nil)
saqlainMclean  = Player.find_or_create_by(name: "Saqlain Mclean",number: 15, position: "F", points: 40, rebounds: 11, assists: 7, steals: 5, team_id: nil)
riverSchmidt  = Player.find_or_create_by(name: "River Schmidt",number: 16, position: "G", points: 28, rebounds: 3, assists: 15, steals: 8, team_id: nil)
murtazaHooper  = Player.find_or_create_by(name: "Murtaza Hooper",number: 17, position: "C", points: 12, rebounds: 14, assists: 8, steals: 1, team_id: nil)
peteBones = Player.find_or_create_by(name: "Pete Bones",number: 18, position: "F", points: 55, rebounds: 0, assists: 0, steals: 0, team_id: nil)