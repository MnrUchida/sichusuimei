class Gogyo < ActiveRecord::Base
  GOGYO_COUNT = 5

  attr_accessible :gogyo_code, :gogyo_name

  has_many :jikkan
end
