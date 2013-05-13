module PillarRelationsHelper

  def display_pillar_table_header
    <<-EOS
      <tr><th></th>
      #{display_pillar_default{ |value| "<th colspan=5>#{translate_meishiki_attribute(value)}</th>"}}
      </tr><tr><th></th>
      #{display_pillar_default{ |value|  "<th>value</th>" + display_pillar_default{|value2| "<th>#{translate_meishiki_attribute(value2)}</th>"}}}
      </tr>
    EOS
  end

  def display_pillar_table(pillar_groups)
    pillar_groups.inject("") do |out_string, (base_pillar, group)|
      out_string += "<tr><th>#{translate_meishiki_attribute(base_pillar)}</th>"

      out_string += display_pillar_table_cell(group){ |target_pillar, target_group|
        yield("[#{base_pillar}][#{target_pillar}][value]", target_group) +
            display_pillar_table_cell(target_group){ |target2_pillar, target2_group|
              yield("[#{base_pillar}][#{target_pillar}][#{target2_pillar}][value]", target2_group)}
      }
      out_string + "</tr>"
    end
  end

  private
  def display_pillar_table_cell(pillar_groups)

    pillar_groups.inject("") do |out_string, (target_pillar, target_group)|
      unless target_pillar == :value
        out_string += yield(target_pillar, target_group)
      end
      out_string
    end
  end

  def display_pillar_default
    SelectParameters.get_value("pillar").inject("") do |out_string,  (key, value)|
      out_string + yield(value)
    end
  end
end
