class Actor < ActiveRecord::Base
has_many :characters 
has_many :shows, through: :characters

def full_name
fullname = "#{first_name}#{last_name}"
fullname
end
 
def list_roles
    characters.collect do |character|
      "#{character.name} - #{character.show.name}"
    end
  end
end