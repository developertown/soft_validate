

class DumbUser < ActiveRecord::Base
  soft_validates_presence_of :first_name
  soft_validates_presence_of :last_name
end
