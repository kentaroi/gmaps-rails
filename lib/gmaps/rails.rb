class GMaps
  module Rails
    class << self
      def to_s19(val)
        case val
        when String, Symbol
          "\"#{val}\""
        when Array, Hash
          val._to_s19
        else
          val.inspect
        end
      end
    end
  end
end

