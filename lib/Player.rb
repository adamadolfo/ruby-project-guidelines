class Player < ActiveRecord::Base
    
    #building relationships
    belongs_to :team
    belongs_to :user, through :team


end
