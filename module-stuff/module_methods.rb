module MyModule
  
  def self.my_mvar
    @my_mvar
  end

  def self.my_mvar=(obj)
    @my_mvar=obj
  end

  def my_mvar
    MyModule.my_mvar
  end
  
  def my_mvar=(obj)
    MyModule.my_mvar=obj
  end
  
end


class MyClass
  include MyModule
end
