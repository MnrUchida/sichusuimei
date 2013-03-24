require 'select_parameters_config'

module SelectParameters

  def self.config
    Thread.current[:select_parameters_config] ||= SelectParametersConfig.new
  end

  def self.get_value(key)
    self.config.get_value(key)
  end
end
