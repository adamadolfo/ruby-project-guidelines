class Team < ActiveRecord::Base

    belongs_to :user
    has_many :players

    # def players
    #     Player.all do |player|
    #         Player.team_id = self.id
    #     end
    # end


end
