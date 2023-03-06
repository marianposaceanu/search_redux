$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'search_redux/version'

Gem::Specification.new do |s|
  s.name          = 'search_redux'
  s.version       = SearchRedux::VERSION
  s.platform      = Gem::Platform::RUBY
  s.licenses      = ['MIT']
  s.summary       = 'Add a text_search method to your models.'
  s.description   = 'Simple ActiveRecord full text search.'
  s.author        = 'Marian Posaceanu'
  s.email         = 'contact@marianposaceanu.com'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']
  s.homepage      = 'https://github.com/dakull/search_redux'

  s.required_ruby_version = '>= 1.9.2'

  s.add_runtime_dependency 'activerecord', '>= 5.0.0'
  s.add_runtime_dependency 'activemodel', '>= 5.0.0'
  s.add_runtime_dependency 'activesupport', '>= 5.0.0'
end
