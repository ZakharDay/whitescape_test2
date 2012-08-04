class Presenter < ActiveRecord::Base
  attr_accessible :about, :name
  
  has_many :presentings, :dependent => :destroy
  has_many :seminars, :through => :presentings, :source => :presentable, :source_type => 'Seminar'
end
