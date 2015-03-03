module CheckOptionsParameters

  def check_for_invalid_options(options={},valid_options=[])
    raise(ArgumentError.new("options is not a Hash: #{options.class}")) unless options.nil? || options.kind_of?(Hash)
    valid_options = Array(valid_options)
    return [] if options.nil? || options.keys.empty? || valid_options.nil? || valid_options.empty?
    options.keys - valid_options
  end

  def check_for_invalid_options!(options={},valid_options=[])
    invalid_options = check_option_parameters(options, valid_options)
    raise "Invalid options given: #{invalid_options}" unless invalid_options.empty?
  end

  def invalid_options?(options={}, valid_options=[])
    check_for_invalid_options.empty?
  end


  def check_for_missing_options(options={}, required_options=[])
    raise(ArgumentError.new("options is not a Hash: #{options.class}")) unless options.kind_of?(Hash)
    required_options = Array(required_options)
    return [] if required_options.empty?    
    required_options - options.keys
  end
  
  def check_for_missing_options!(options={}, required_options=[])
    missing_options = check_for_missing_options(options, required_options)
    raise "Required options missing: #{missing_options}" unless missing_options.empty?
  end

  def missing_options?(options={}, require_options=[])
    check_for_missing_options(options, require_options).empty?
  end

end

