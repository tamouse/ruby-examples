class CheckOptionsParameters 
  
  attr_accessor :options, :options_keys, :valid_options

  def initialize(options, valid)
    self.options = options.nil? ? {} : Hash(options.dup)
    self.options_keys = @options.keys
    self.valid_options = valid.nil? ? [] : Array(valid.dup)
  end

  def validate
    missing == [] && extras == []
  end

  def missing
    valid_options - options_keys
  end

  def extras
    options_keys - valid_options
  end

end
