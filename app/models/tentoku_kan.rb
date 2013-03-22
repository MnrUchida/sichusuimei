class TentokuKan < Tentoku
  def name()
    jikkan = Jikkan.find_by_jikkan_code(self.tentoku)
    jikkan.jikkan_name
  end
end
