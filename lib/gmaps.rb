require 'active_support/core_ext/string/output_safety'
require 'gmaps/js'
require 'gmaps/rails/core_ext'

class GMaps
  class << self
    def [](*args)
      GMaps.new(*args)
    end
  end

  attr_accessor :map, :directives

  def initialize(options={})
    @map = options
    @directives = []
  end

  def method_missing(m, *args)
    @directives << {name: m, args: args}
  end

  def name
    @name ||= @map[:div] ? @map[:div].gsub(/[#\.]/, '') : 'map'
  end
  attr_writer :name

  def to_js
    ("var #{name} = GMaps(#{{div: '#map'}.merge!(@map)._to_s19});\n" +
    @directives.map{ |directive|
      func = directive[:name]
      args = directive[:args]
      "#{name}.#{func}(#{args.map{|e| e._to_s19}.join(', ')})"
    }.join(";\n")).html_safe
  end

  def to_s
    {map: @map, directives: @directives}._to_s19
  end
end
