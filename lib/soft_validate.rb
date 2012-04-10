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
    
    def progress_complete_count
      self.soft_attributes.length
    end
    
    def soft_valid?

      self.soft_attributes.each do |a|
        return false if self.attributes[a.to_s].nil?
      end

      true
    end

    def soft_errors
      errors = {}
      self.soft_attributes.each do |a|
        if self.attributes[a.to_s].nil?
          errors[a] = "shouldn't be blank"
        end
      end

      errors
    end

    def progress_count
      count = 0

      self.soft_attributes.each do |a|
        if !self.attributes[a.to_s].nil?
          count += 1
        end
      end

      count
    end

    def progress_percent
      self.progress_count.to_f / self.progress_complete_count.to_f
    end
  end

end

ActiveRecord::Base.send :include, SoftValidate
