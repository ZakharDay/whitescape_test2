class Seminar < ActiveRecord::Base
  attr_accessible :body, :title
  
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  
  has_many :presentings, :as => :presentable
  has_many :presenters, :through => :presentings
end
