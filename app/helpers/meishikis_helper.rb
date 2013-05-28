module MeishikisHelper
  def display_class_kan(pillar)
    "class = tentoku" if pillar.tentoku?(pillar.tenkan)
  end

  def display_class_shi(pillar)
    ret_value = nil
    ret_value = "class = kubou" if pillar.kubou?
    ret_value = "class = tentoku" if pillar.tentoku?(pillar.chishi)
    ret_value
  end

  def display_two_pillar_relation(meishiki, method_name)
    PillarRelation.where(:name => method_name).inject("") do |ret_data, pillar_relation|
      pillar_relation.pillar_relation_pillars.each do |pillar|
        ret_data += content_of_pillar_relation(pillar) if result_of_pillar_relation(meishiki, method_name, pillar)
      end
      ret_data
    end
  end

  def content_of_pillar_relation(pillar)
    "<tr><td>" + translate_meishiki_attribute(pillar.base_pillar) +
        content_of_target_pillar(pillar.target_pillar) +
        content_of_target_pillar(pillar.target2_pillar) +
        "</td></tr>"
  end

  def content_of_target_pillar(target_pillar)
    return "" if target_pillar.nil?
    "-" + translate_meishiki_attribute(target_pillar)
  end

  def result_of_pillar_relation(meishiki, method_name, pillar)
    meishiki.pillar(pillar.base_pillar).send(method_name.to_sym,
                                             :target_pillar => meishiki.pillar(pillar.target_pillar),
                                             :target2_pillar => meishiki.pillar(pillar.target2_pillar))
  end

  def translate_meishiki_attribute(attribute)
    I18n.t("activerecord.attributes.meishiki." + attribute)
  end
end
