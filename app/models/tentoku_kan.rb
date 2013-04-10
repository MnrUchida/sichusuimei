class TentokuKan < Tentoku
  def name()
    jikkan = Jikkan.where(:code => self.tentoku).first
    jikkan.name
  end
end
