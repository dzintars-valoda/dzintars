# encoding: utf-8

require 'ruby2ruby'
require 'ruby_parser'
require 'dzintars/ruby_parser_patches'

module Dzintars

  class Kompilators

    def initialize

    end

    SĀKUMA_KODS = "# encoding: utf-8\nrequire \"dzintars/core_ext\"\n"

    def uz_ruby(kods)
      ruby2ruby = Ruby2Ruby.new
      parser = RubyParser.new
      sexp = parser.process("# encoding: utf-8\n#{kods}")

      ruby_kods = ruby2ruby.process(sexp)

      "#{SĀKUMA_KODS}#{ruby_kods}"
    end

  end

end

