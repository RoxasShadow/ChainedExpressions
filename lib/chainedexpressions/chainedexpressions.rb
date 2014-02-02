#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

module ChainedExpressions
  @@operators = {
    :<   => :lt,
    :<=  => :lte,
    :>=  => :gte,
    :>   => :gt
  }

  refine Numeric do
    def eval_expression(op, n)
      case op
        when :<   then (self <=> n) == -1
        when :<=  then (self <=> n) == -1 || (self <=> n) == 0
        when :>=  then (self <=> n) ==  0 || (self <=> n) == 1
        when :>   then (self <=> n) ==  1
      end
    end
  end

  %w(TrueClass FalseClass).each { |c|
    eval <<-EOM
      refine #{c} do
        @@operators.each { |op, o|
          define_method o do |n|            
            prev = @@prev
            @@prev = n
            prev.eval_expression op, n
          end

          alias_method op, o
        }
      end
    EOM
  }

  %w(Fixnum Float Bignum).each { |c|
    eval <<-EOM
      refine #{c} do
        @@operators.each { |op, o|
          define_method o do |n|
            @@prev = n
            eval_expression op, n
          end

          alias_method op, o
        }
      end
    EOM
  }
end

