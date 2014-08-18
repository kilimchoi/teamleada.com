class HashObject
  # Idea borrowed from http://pullmonkey.com/2008/01/06/convert-a-ruby-hash-into-a-class-object/
  # This class allows you to make a hash into an object that you can use dot notation on.
  # Example:
  #     hash = {a: 1, b: 2}
  #     hash_object = HashObject.new(hash)
  #     hash_object.a <-- returns 1

  def initialize(hash)
    if hash.is_a?(Integer) || hash.is_a?(String)
      return hash
    end

    hash.each do |k, v|
      if v.is_a?(Array)
        v = v.map{ |item| HashObject.new(item) }
      elsif v.is_a?(Hash)
        v = HashObject.new(v)
      end
      self.instance_variable_set("@#{k}", v)
      self.class.send(:define_method, k, proc{self.instance_variable_get("@#{k}")})
      self.class.send(:define_method, "#{k}=", proc{|v| self.instance_variable_set("@#{k}", v)})
    end
  end

end
