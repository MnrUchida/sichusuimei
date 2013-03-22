class TentokuShi < Tentoku
  def name()
    junishi = Junishi.find_by_shi_code(self.tentoku)
    junishi.shi_name
  end
end
