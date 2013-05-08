module MeishikisHelper
  def display_class_kan(pillar)
    "class = tentoku" if pillar.tentoku_kan?
  end

  def display_class_shi(pillar)
    ret_value = nil
    ret_value = "class = kubou" if pillar.kubou?
    ret_value = "class = tentoku" if pillar.tentoku_shi?
    ret_value
  end
end
