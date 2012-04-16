

class UserWithNonExistentValidatedAttr < ActiveRecord::Base
  soft_validates_presence_of :first_name
  soft_validates_presence_of :last_name

  #Should bomb on this one...
  soft_validates_presence_of :address_line1
end