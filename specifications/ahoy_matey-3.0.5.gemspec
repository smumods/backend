# -*- encoding: utf-8 -*-
# stub: ahoy_matey 3.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "ahoy_matey".freeze
  s.version = "3.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrew Kane".freeze]
  s.date = "2020-09-10"
  s.email = "andrew@chartkick.com".freeze
  s.homepage = "https://github.com/ankane/ahoy".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Simple, powerful, first-party analytics for Rails".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 5"])
    s.add_runtime_dependency(%q<geocoder>.freeze, [">= 1.4.5"])
    s.add_runtime_dependency(%q<safely_block>.freeze, [">= 0.2.1"])
    s.add_runtime_dependency(%q<device_detector>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<combustion>.freeze, [">= 0"])
    s.add_development_dependency(%q<rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_development_dependency(%q<pg>.freeze, [">= 0"])
    s.add_development_dependency(%q<mysql2>.freeze, [">= 0"])
    s.add_development_dependency(%q<mongoid>.freeze, [">= 0"])
    s.add_development_dependency(%q<browser>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<user_agent_parser>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 5"])
    s.add_dependency(%q<geocoder>.freeze, [">= 1.4.5"])
    s.add_dependency(%q<safely_block>.freeze, [">= 0.2.1"])
    s.add_dependency(%q<device_detector>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<combustion>.freeze, [">= 0"])
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<mysql2>.freeze, [">= 0"])
    s.add_dependency(%q<mongoid>.freeze, [">= 0"])
    s.add_dependency(%q<browser>.freeze, ["~> 2.0"])
    s.add_dependency(%q<user_agent_parser>.freeze, [">= 0"])
  end
end
