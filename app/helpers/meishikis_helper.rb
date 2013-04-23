module MeishikisHelper
  def display_class_kan(pillar)
    "class = tentoku" if pillar.tentoku_kan?
  end

  def display_class_shi(pillar)
    "class = kubou" if pillar.kubou?
    "class = tentoku" if pillar.tentoku_shi?
  end
end
