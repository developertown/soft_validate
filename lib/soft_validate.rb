require 'active_record'

module SoftValidate

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    # any method placed here will apply to classes, like Hickwall
    def soft_validates_presence_of(attr)
      send :include, InstanceMethods
    end


  end

  module InstanceMethods
    # any method placed here will apply to instaces, like @hickwall
    def soft_valid?
      false
    end
  end

end

ActiveRecord::Base.send :include, SoftValidate
