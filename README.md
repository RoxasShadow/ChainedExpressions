ChainedExpressions
==================

What is
-------
It implement chained expressions in Ruby. So you are able to do

```ruby
require 'chainedexpressions'
using ChainedExpressions

20 < 25
20 < 25 < 30

20 <= 25 <= 30 <= 30 <= 35

35 > 30 > 25  > 20
20 >  3 > 2.2 > -2

35 >= 30 >= 30 >= 25 >= 20
```

Install
-------
`$ gem install chainedexpressions`
