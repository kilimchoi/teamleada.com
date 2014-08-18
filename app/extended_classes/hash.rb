class Hash

  def symbolize_keys
    # Borrowed from:
    # https://gist.github.com/Integralist/9503099
    return self.reduce({}) do |memo, (k, v)|
      memo.tap { |m| m[k.to_sym] = v.deep_symbolize_keys }
    end if self.is_a? Hash

    return self.reduce([]) do |memo, v|
      memo << v.deep_symbolize_keys; memo
    end if self.is_a? Array

    self
  end

end
