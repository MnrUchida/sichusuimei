require 'yaml'
require 'base_data'

class HentsuseiData
  include BaseData

  def initialize
    init_data(Hentsusei)
  end

  def by_inyou(inyou)
    select_by(@data){|datum|datum.inyou == inyou}
  end

  def by_inyou_and_category(inyou, category)
    find_by(by_inyou(inyou)){|datum|datum.category == category}
  end
end
