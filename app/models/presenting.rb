class Presenting < ActiveRecord::Base
  attr_accessible :presentable_id, :presentable_type, :presenter_id
  
  belongs_to :presentable, :polymorphic => true
  belongs_to :presenter
end
