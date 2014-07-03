require 'active_support/core_ext/string/output_safety'

class GMaps
  class JS
    class << self
      def [](*args)
        self.new(*args)
      end
    end

    def initialize(str, *args)
      @str = if args.empty?
               str
             elsif args.length == 1 && args.first.is_a?(Hash)
               escaped_args = {}
               args.first.each { |k, v| escaped_args[k] = v.is_a?(String) ? escape_javascript(v) : v}
               str % (escaped_args)
             else
               args.map!{ |arg| arg.is_a?(String) ? escape_javascript(arg) : arg}
               str % args
             end
    end

    def inspect
      @str
    end
    alias to_s inspect


    ###################################################
    # escape_javascript
    # Copied from ActionView::Helpers::JavaScriptHelper
    JS_ESCAPE_MAP = {
      '\\'    => '\\\\',
      '</'    => '<\/',
      "\r\n"  => '\n',
      "\n"    => '\n',
      "\r"    => '\n',
      '"'     => '\\"',
      "'"     => "\\'"
    }

    JS_ESCAPE_MAP["\342\200\250".force_encoding(Encoding::UTF_8).encode!] = '&#x2028;'
    JS_ESCAPE_MAP["\342\200\251".force_encoding(Encoding::UTF_8).encode!] = '&#x2029;'

    # Escapes carriage returns and single and double quotes for JavaScript segments.
    #
    # Also available through the alias j(). This is particularly helpful in JavaScript
    # responses, like:
    #
    #   $('some_element').replaceWith('<%=j render 'some/element_template' %>');
    def escape_javascript(javascript)
      if javascript
        result = javascript.gsub(/(\\|<\/|\r\n|\342\200\250|\342\200\251|[\n\r"'])/u) {|match| JS_ESCAPE_MAP[match] }
        javascript.html_safe? ? result.html_safe : result
      else
        ''
      end
    end
  end
end
