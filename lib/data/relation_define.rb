module RelationDefine
  def def_method_relation(method_relation)
    return if method_relation.nil?
    method_relation.each do |method_name, relation|
      complete_target = def_target_method(method_name, relation){|define, name| yield(define, name)}
      def_default_method(method_name, relation, complete_target || []){|define, name| yield(define, name)}
    end
  end

  def angle_relation_string(angle_relation, method_name)
    <<-EOS
      def #{method_name.to_s}_angle
        #{angle_relation_angle_string(angle_relation)}
      end

      def #{method_name.to_s}
        Junishi.by_angle(#{method_name.to_s}_angle.to_i)
      end

      def #{method_name.to_s}?(relate_junishi)
        relate_junishi.angle == #{method_name.to_s}_angle.to_i
      end
    EOS
  end

  def jikkan_relation_string(jikkan_relation, method_name)
    <<-EOS
      def #{method_name.to_s}_code
        (#{jikkan_relation}) % Jikkan::JIKKAN_COUNT
      end

      def #{method_name.to_s}
        Jikkan.by_code(#{method_name.to_s}_code)
      end

      def #{method_name.to_s}?(relate_jikkan)
        relate_jikkan.code == #{method_name.to_s}_code
      end
    EOS
  end

  def method_relation_string(method_relation, method_name)
    <<-EOS
        def #{method_name.to_s}(target = nil)
          #{method_relation}
        end
    EOS
  end

  private
  def def_target_method(method_name, relation)
    return unless relation.key?('method')

    relation['method'].inject([]) do |complete_target, method_define|
      complete_target + method_define['target'].map do |target|
        @data[target].instance_eval yield(method_define['define'], method_name)
        target
      end
    end
  end

  def def_default_method(method_name, relation, complete_target)
    return unless relation.key?('default_method')

    @data.each do |key, target|
      next if complete_target.any?{|complete_key| complete_key == key}
      target.instance_eval yield(relation['default_method'], method_name)
    end
  end
end