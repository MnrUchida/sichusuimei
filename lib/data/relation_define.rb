module RelationDefine
  def angle_relation_string_new(angle_relation, method_name)
    <<-EOS
      def #{method_name.to_s}_angle
        #{angle_relation_angle_string(angle_relation)}
      end

      def #{method_name.to_s}
        Junishi.by_angle(#{method_name.to_s}_angle)
      end

      def #{method_name.to_s}?(relate_junishi)
        relate_junishi.angle == #{method_name.to_s}_angle
      end
    EOS
  end

  def def_method_relation_new(method_relation)
    return if method_relation.nil?
    method_relation.each do |method_name, relation|
      complete_target = def_target_method(method_name, relation){|define, name| yield(define, name)}
      def_default_method(method_name, relation, complete_target || []){|define, name| yield(define, name)}
    end
  end

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

  def method_relation_string_new(method_relation, method_name)
    <<-EOS
        def #{method_name.to_s}(target = nil)
          #{method_relation}
        end
    EOS
  end















  def def_junishi_angle_relation(target, angle_relation)
    angle_relation.each do |method_name, relation|
      target.instance_eval angle_relation_string(relation, method_name)
    end
  end

  def def_method_relation(target, method_relation)
    return if method_relation.nil?
    method_relation.each do |method_name, relation|
      target.instance_eval method_relation_string(relation, method_name)
    end
  end

  private
  def method_relation_string(method_relation, method_name)
    <<-EOS
        def #{method_name.to_s}(target = nil)
          #{method_relation_no_method_string(method_relation, method_name)}
        end
    EOS
  end

  def method_relation_no_method_string(method_relation, method_name)
    if @relation.key?(method_name.to_s)
      <<-EOS
#{method_relation["method"][@relation[method_name.to_s]]}
      EOS
    end
  end

  def angle_relation_string(angle_relation, method_name)
    <<-EOS
      def #{method_name.to_s}_angle
        #{angle_relation_angle_string(angle_relation, method_name)}
      end

      def #{method_name.to_s}
        Junishi.by_angle(#{method_name.to_s}_angle)
      end

      def #{method_name.to_s}?(relate_junishi)
        relate_junishi.angle == #{method_name.to_s}_angle
      end
    EOS
  end
end
