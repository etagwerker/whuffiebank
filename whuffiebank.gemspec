# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{whuffiebank}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ernesto Tagwerker"]
  s.date = %q{2010-01-15}
  s.description = %q{This gem implements the thewhuffiebank.org API. WARNING: STILL UNDER DEVELOPMENT.}
  s.email = ["etagwerker@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README", "README.rdoc", "Rakefile", "lib/whuffiebank.rb", "script/console", "script/destroy", "script/generate", "test/test_helper.rb", "test/test_whuffiebank.rb"]
  s.homepage = %q{http://github.com/etagwerker/whuffiebank}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{whuffiebank}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{This gem implements the thewhuffiebank.org API}
  s.test_files = ["test/test_helper.rb", "test/test_whuffiebank.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
      s.add_development_dependency(%q<httparty>, ["~> 0.4.5"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 2.10.1"])
      s.add_development_dependency(%q<mocha>, ["= 0.9.4"])
      s.add_development_dependency(%q<jnunemaker-matchy>, ["= 0.4.0"])
      s.add_development_dependency(%q<fakeweb>, [">= 1.2.5"])      
    else
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
      s.add_dependency(%q<httparty>, ["~> 0.4.5"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 2.10.1"])
      s.add_dependency(%q<mocha>, ["= 0.9.4"]) 
      s.add_dependency(%q<jnunemaker-matchy>, ["= 0.4.0"])
      s.add_dependency(%q<fakeweb>, [">= 1.2.5"])      
    end
  else
    s.add_dependency(%q<httparty>, ["~> 0.4.5"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 2.10.1"])
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
    s.add_dependency(%q<mocha>, ["= 0.9.4"])
    s.add_dependency(%q<jnunemaker-matchy>, ["= 0.4.0"])
    s.add_dependency(%q<fakeweb>, [">= 1.2.5"])      
  end
end
