Gem::Specification.new do |s|
  s.name          = 'fulltext_search_redux'
  s.version       = FulltextSearchRedux::VERSION
  # s.platform      = Gem::Platform::RUBY
  s.summary       = 'Add a text_search method to your models.'
  s.description   = 'Simple ActiveRecord full text search.'
  s.author        = 'Marian Posaceanu'
  s.email         = 'contact@marianposaceanu.com'
  s.files         = `git ls-files`.split('\n') 
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.require_paths = ['lib']
  s.homepage      = 'http://marianposaceanu.com'

  s.required_ruby_version = '>= 1.9.2'

  s.add_dependency('activerecord', '>= 3.0.0')
  s.add_dependency('activemodel', '>= 3.0.0')
  s.add_dependency('activesupport', '>= 3.0.0')
end
