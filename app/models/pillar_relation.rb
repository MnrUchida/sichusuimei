class PillarRelation < ActiveRecord::Base
  attr_accessible :name ,:subject ,:method ,:arg
  has_many :pillar_relation_pillars

  accepts_nested_attributes_for :pillar_relation_pillars
end
