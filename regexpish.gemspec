# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

# gem build regexpish.gemspec
# gem install regexpish-0.1.0.gem

Gem::Specification.new do |s|
   s.name        = "regexpish"
   s.version     = "0.1.0"
   s.platform    = Gem::Platform::RUBY
   s.date        = "2010-06-01"
   s.authors     = ["Field S"]
   s.email       = ["fieldseo8@gmail.com"]
   s.summary     = "Help with regular-expression(regexp) tasks"
   s.homepage    = "http://github.com/fieldseo/"
   s.description = %q{Build regular expression (Regexp) objects by using regexp syntax in strings 
                      and changing modifiers flags for existing Regexp objects and other functionality.}
   s.files = ["lib/regexpish.rb", "README.rdoc"]
   # s.rubyforge_project = 'regexpish'
   s.has_rdoc          = false
   s.test_files        = ['test/tc_regexpish.rb','test/tc_update_flag_number.rb']
end


