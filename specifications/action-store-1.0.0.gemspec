# -*- encoding: utf-8 -*-
# stub: action-store 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "action-store".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jason Lee".freeze]
  s.date = "2017-02-04"
  s.description = "Store difference kind of actions (Like, Follow, Star, Block ...) in one table via ActiveRecord Polymorphic Association.".freeze
  s.email = "huacnlee@gmail.com".freeze
  s.homepage = "https://github.com/rails-engine/action-store".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Store difference kind of actions (Like, Follow, Star, Block ...) in one table.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 5.2", "< 7"])
    s.add_development_dependency(%q<mysql2>.freeze, [">= 0"])
    s.add_development_dependency(%q<factory_bot>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<codecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 5.2", "< 7"])
    s.add_dependency(%q<mysql2>.freeze, [">= 0"])
    s.add_dependency(%q<factory_bot>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<codecov>.freeze, [">= 0"])
  end
end
