require 'gmaps/rails'

class Array
  def _to_s19
    '[' + self.map { |e| GMaps::Rails.to_s19(e) }.join(', ') + ']'
  end
end

class Hash
  def _to_s19
    '{' + self.map { |k, v|
      "#{k}: #{GMaps::Rails.to_s19(v)}"
    }.join(', ') + '}'
  end
end
