

class DumbUser < ActiveRecord::Base

  soft_validates_presence_of :foo
end
