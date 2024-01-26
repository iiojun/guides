# -*- encoding: utf-8 -*-
# stub: octicons_helper 19.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "octicons_helper".freeze
  s.version = "19.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["GitHub Inc.".freeze]
  s.date = "2023-09-19"
  s.description = "A rails helper that makes including svg Octicons simple.".freeze
  s.email = ["support@github.com".freeze]
  s.homepage = "https://github.com/primer/octicons".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.15".freeze
  s.summary = "Octicons rails helper".freeze

  s.installed_by_version = "3.4.15" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<octicons>.freeze, ["= 19.8.0"])
  s.add_runtime_dependency(%q<railties>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<actionview>.freeze, [">= 0"])
end
