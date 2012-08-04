class Tag < ActiveRecord::Base
  attr_accessible :name
  
  has_many :taggings, :dependent => :destroy
  has_many :seminars, :through => :taggings, :source => :taggable, :source_type => 'Seminar'
end
