class TentokuShi < Tentoku
  def name()
    junishi = Junishi.where(:code => self.tentoku).first
    junishi.name
  end
end
