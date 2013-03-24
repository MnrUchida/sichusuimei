require 'yaml'

class SelectParametersConfig

  @yaml_data = Hash.new

  def initialize
    @yaml_data = YAML.load_file('config/select_parameters.yml')
  end

  def get_value(param_key)
    ret_data = @yaml_data
    param_key.split(".").each do |key|
      ret_data = ret_data[key]
    end
    ret_data
  end

end
