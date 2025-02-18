# -*- encoding: utf-8 -*-
# stub: skylight 4.3.1 ruby lib
# stub: ext/extconf.rb

Gem::Specification.new do |s|
  s.name = "skylight".freeze
  s.version = "4.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tilde, Inc.".freeze]
  s.date = "2020-06-24"
  s.email = ["engineering@tilde.io".freeze]
  s.executables = ["skylight".freeze]
  s.extensions = ["ext/extconf.rb".freeze]
  s.files = ["bin/skylight".freeze, "ext/extconf.rb".freeze]
  s.homepage = "https://www.skylight.io".freeze
  s.licenses = ["Nonstandard".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Skylight is a smart profiler for Rails, Sinatra, and other Ruby apps.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<skylight-core>.freeze, ["= 4.3.1"])
    s.add_development_dependency(%q<beefcake>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.17.3"])
    s.add_development_dependency(%q<puma>.freeze, [">= 0"])
    s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.3.3"])
    s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 1.0.4"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7"])
    s.add_development_dependency(%q<rspec-collection_matchers>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9"])
    s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
  else
    s.add_dependency(%q<skylight-core>.freeze, ["= 4.3.1"])
    s.add_dependency(%q<beefcake>.freeze, ["~> 1.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.17.3"])
    s.add_dependency(%q<puma>.freeze, [">= 0"])
    s.add_dependency(%q<rack-test>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3.3"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.0.4"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
    s.add_dependency(%q<rspec-collection_matchers>.freeze, ["~> 1.1"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.9"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
  end
end
