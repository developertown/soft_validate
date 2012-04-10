require 'active_record'
require 'pry'

module SoftValidate

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    # any method placed here will apply to classes, like Hickwall

    def soft_validates_presence_of(attr)
      cattr_accessor :soft_attributes
      self.soft_attributes ||= Array.new
      self.soft_attributes << attr
      send :include, InstanceMethods
    end

  end

  module InstanceMethods
    # any method placed here will apply to instaces, like @hickwall
    
    def soft_valid?

      self.soft_attributes.each do |a|
        return false if self.attributes[a.to_s].nil?
      end

      true
    end
  end

end

ActiveRecord::Base.send :include, SoftValidate
