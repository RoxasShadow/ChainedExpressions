#! /usr/bin/env ruby
#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

require 'rubygems'
require 'chainedexpressions'
using ChainedExpressions

describe ChainedExpressions do
  it 'can evaluate true expressions' do
    (20 < 25          ).should be true
    (20 < 25 < 30     ).should be true
    (35 > 30 > 25 > 20).should be true

    (20   <= 25 <= 30  <= 30  <= 35).should be true
    (35   >= 30 >= 30  >= 25  >= 20).should be true
    (20.5 >= 10 >= 2.5 >= 2.5      ).should be true
  end

  it 'can evaluate false expressions' do
    (30 < 25          ).should be false
    (30 < 25 < 20     ).should be false
    (20 > 25 > 30 > 35).should be false

    (35   <= 30 <= 30  <= 25  <= 20).should be false
    (20   >= 25 >= 30  >= 30  >= 35).should be false
    (20.5 >= 10 >= 2.5 >= 3.5      ).should be false
  end
end