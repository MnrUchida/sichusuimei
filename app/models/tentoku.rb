class Tentoku < ActiveRecord::Base
  attr_accessible :shi_id, :tentoku

  def target?(target)
    target.code == self.tentoku
  end
end
