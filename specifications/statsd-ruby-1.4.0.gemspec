# -*- encoding: utf-8 -*-
# stub: statsd-ruby 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "statsd-ruby".freeze
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alex Williams".freeze, "Andrew Meyer".freeze, "Chris Gaffney".freeze, "Cody Cutrer".freeze, "Corey Donohoe".freeze, "Dotan Nahum".freeze, "Erez Rabih".freeze, "Eric Chapweske".freeze, "Gabriel Burt".freeze, "Hannes Georg".freeze, "James Tucker".freeze, "Jeremy Kemper".freeze, "John Nunemaker".freeze, "Lann Martin".freeze, "Mahesh Murthy".freeze, "Manu J".freeze, "Matt Sanford".freeze, "Nate Bird".freeze, "Noah Lorang".freeze, "Oscar Del Ben".freeze, "Peter Mounce".freeze, "Ray Krueger".freeze, "Reed Lipman".freeze, "Rein Henrichs".freeze, "rick".freeze, "Ryan Tomayko".freeze, "Schuyler Erle".freeze, "Thomas Whaples".freeze, "Trae Robrock".freeze]
  s.date = "2017-03-29"
  s.description = "A Ruby StatsD client (https://github.com/etsy/statsd)".freeze
  s.email = "reinh@reinh.com".freeze
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.rdoc".freeze]
  s.files = ["LICENSE.txt".freeze, "README.rdoc".freeze]
  s.homepage = "https://github.com/reinh/statsd".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "A Ruby StatsD client".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<minitest>.freeze, [">= 3.2.0"])
    s.add_development_dependency(%q<yard>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.6.4"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<minitest>.freeze, [">= 3.2.0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.6.4"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
