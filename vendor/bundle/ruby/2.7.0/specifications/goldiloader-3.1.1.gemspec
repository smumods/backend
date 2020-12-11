# -*- encoding: utf-8 -*-
# stub: goldiloader 3.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "goldiloader".freeze
  s.version = "3.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/salsify/goldiloader/issues", "changelog_uri" => "https://github.com/salsify/goldiloader/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/salsify/goldiloader", "source_code_uri" => "https://github.com/salsify/goldiloader/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Joel Turkel".freeze]
  s.date = "2019-05-08"
  s.description = "Automatically eager loads Rails associations as associations are traversed".freeze
  s.email = ["jturkel@salsify.com".freeze]
  s.homepage = "https://github.com/salsify/goldiloader".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Automatic Rails association eager loading".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.2", "< 6.1"])
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4.2", "< 6.1"])
    s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_development_dependency(%q<benchmark-ips>.freeze, [">= 0"])
    s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_development_dependency(%q<database_cleaner>.freeze, [">= 1.2"])
    s.add_development_dependency(%q<mime-types>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_development_dependency(%q<salsify_rubocop>.freeze, ["= 0.52.1.1"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 4.2", "< 6.1"])
    s.add_dependency(%q<activesupport>.freeze, [">= 4.2", "< 6.1"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_dependency(%q<benchmark-ips>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 1.2"])
    s.add_dependency(%q<mime-types>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<salsify_rubocop>.freeze, ["= 0.52.1.1"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
  end
end
