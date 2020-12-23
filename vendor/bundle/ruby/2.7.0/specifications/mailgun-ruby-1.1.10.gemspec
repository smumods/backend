# -*- encoding: utf-8 -*-
# stub: mailgun-ruby 1.1.10 ruby lib

Gem::Specification.new do |s|
  s.name = "mailgun-ruby".freeze
  s.version = "1.1.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mailgun".freeze, "Travis Swientek".freeze]
  s.date = "2018-06-11"
  s.description = "Mailgun's Official Ruby SDK for interacting with the Mailgun API.".freeze
  s.email = "support@mailgunhq.com".freeze
  s.homepage = "http://www.mailgun.com".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Mailgun's Official Ruby SDK".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 1.22"])
    s.add_development_dependency(%q<pry>.freeze, ["~> 0.9"])
    s.add_development_dependency(%q<vcr>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.11"])
    s.add_development_dependency(%q<rails>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.22"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.9"])
    s.add_dependency(%q<vcr>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.11"])
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<rest-client>.freeze, ["~> 2.0"])
  end
end
