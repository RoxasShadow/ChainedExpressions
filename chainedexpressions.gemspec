Kernel.load 'lib/chainedexpressions/version.rb'

Gem::Specification.new { |s|
  s.name          = 'chainedexpressions'
  s.version       = ChainedExpressions::VERSION
  s.author        = 'Giovanni Capuano'
  s.email         = 'webmaster@giovannicapuano.net'
  s.homepage      = 'https://github.com/RoxasShadow'
  s.summary       = 'Chained expressions in ruby'
  s.description   = 'Implement chained expressions in ruby'
  s.licenses      = 'WTFPL'

  s.require_paths = ['lib']
  s.files         = Dir.glob('lib/**/*.rb')
  s.test_files    = Dir.glob('tests/**/*_spec.rb')

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
}