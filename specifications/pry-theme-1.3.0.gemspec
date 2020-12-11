# -*- encoding: utf-8 -*-
# stub: pry-theme 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "pry-theme".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kyrylo Silin".freeze]
  s.date = "2019-01-26"
  s.description = "The plugin enables color theme support for Pry.".freeze
  s.email = "silin@kyrylo.org".freeze
  s.homepage = "https://github.com/kyrylo/pry-theme".freeze
  s.licenses = ["zlib".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "An easy way to customize Pry colors via theme files".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<coderay>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.0"])
  else
    s.add_dependency(%q<coderay>.freeze, ["~> 1.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.0"])
  end
end
