require 'active_record'

module SoftValidate
  extend ActiveSupport::Concern

  module ClassMethods
    def soft_validates_presence_of(attr)
      cattr_accessor :soft_attributes
      self.soft_attributes ||= Array.new
      self.soft_attributes << attr
    end

  end

  def progress_complete_count
    self.soft_attributes.length
  end

  def soft_valid?
    self.soft_attributes.all? { |a| !self.attributes[a.to_s].blank? }
  end

  def soft_errors
    Hash[ self.soft_attributes.map { |a| [a, "shouldn't be blank"] if self.attributes[a.to_s].blank? } ]
  end

  def progress_count
    self.soft_attributes.count { |a| !self.attributes[a.to_s].blank? }
  end

  def progress_percent
    self.progress_count.to_f / self.progress_complete_count.to_f
  end
end

ActiveRecord::Base.send :include, SoftValidate
