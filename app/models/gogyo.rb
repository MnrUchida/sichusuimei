class Gogyo < ActiveRecord::Base
  GOGYO_COUNT = 5

  attr_accessible :code, :name

  has_many :jikkan
end
