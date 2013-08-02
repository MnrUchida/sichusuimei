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

    PillarRelationData.instance.pillars_by_relation_name(method_name).inject("") do |ret_data, pillars|
      ret_data += content_of_pillar_relation(pillars) if result_of_pillar_relation(meishiki, method_name, pillars)
      ret_data
    end
  end

  def display_pillar_relation(meishiki, method_name, display_string)
    PillarRelationData.instance.pillars_by_relation_name(method_name).inject("") do |ret_data, pillars|
      ret_data += content_of_target_pillar_relation(pillars, display_string) if result_of_pillar_relation(meishiki, method_name, pillars)
      ret_data
    end
  end

  private
  def content_of_target_pillar_relation(pillar, display_string)
    "<tr><td>#{display_string}#{content_of_pillars(pillar[:target])}</td></tr>"
  end

  def content_of_pillar_relation(pillar)
    "<tr><td>#{translate_meishiki_attribute(pillar[:base_pillar])}#{content_of_pillars(pillar[:target])}</td></tr>"
  end

  def content_of_target_pillar(target_pillar)
    return '' if target_pillar.nil?
    '-' + translate_meishiki_attribute(target_pillar)
  end

  def result_of_pillar_relation(meishiki, method_name, pillar)
    puts method_name + " " + pillars_hash(meishiki, pillar[:target]).inspect
    meishiki.pillar(pillar[:base_pillar]).send(method_name.to_sym,
                                               pillars_hash(meishiki, pillar[:target]))
  end

  def translate_meishiki_attribute(attribute)
    I18n.t("activerecord.attributes.meishiki." + attribute)
  end

  private
  def content_of_pillars(pillars)
    pillars.inject('') do |content, target|
      content + content_of_target_pillar(target)
    end
  end

  def pillars_hash(meishiki, pillars)
    ret_data = Hash.new
    pillars.each_with_index do |target, index|
      target_index = index + 1 if index > 0
      ret_data["target#{target_index}_pillar".to_sym] = meishiki.pillar(target)
    end
    ret_data
  end
end
