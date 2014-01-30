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
  $operators = {
    :<   => :lt,
    :<=  => :lte,
    :>=  => :gte,
    :>   => :gt,
  }

  %w(TrueClass FalseClass).each { |c|
    eval <<-EOM
      refine #{c} do
        $operators.each { |k, o|
          define_method(o) do |*exp|
            $f.exp_true? k, exp.first
          end

          alias_method k, o
        }
      end
    EOM
  }

  refine Fixnum do
    def exp_true?(op, n)
      case op
        when :<  then (self <=> n) == -1
        when :<= then (self <=> n) == -1 || (self <=> n) == 0
        when :>= then (self <=> n) ==  0 || (self <=> n) == 1
        when :>  then (self <=> n) ==  1
      end
    end

    $operators.each { |k, o|
      define_method(o) do |*exp|
        exp.each { |n|
          $f = n
          return false unless self.exp_true? k, n
        }

        true
      end

      alias_method k, o
    }
  end
end