# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{archives}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Hyunwoo Park"]
  s.date = %q{2008-12-11}
  s.description = %q{Ruby Gem for Korea Government Archives Search OpenAPI}
  s.email = %q{hwpark@oksurerails.com}
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "lib/archives/base.rb", "lib/archives/item.rb", "lib/archives/rss.rb", "lib/archives.rb", "README.rdoc"]
  s.files = ["CHANGELOG.rdoc", "init.rb", "lib/archives/base.rb", "lib/archives/item.rb", "lib/archives/rss.rb", "lib/archives.rb", "rakefile", "README.rdoc", "test/test_archives.rb", "Rakefile", "Manifest", "archives.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://oksurerails.com/ruby/archives}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Archives", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{archives}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby Gem for Korea Government Archives Search OpenAPI}
  s.test_files = ["test/test_archives.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<libxml-ruby>, [">= 0.9.2"])
    else
      s.add_dependency(%q<libxml-ruby>, [">= 0.9.2"])
    end
  else
    s.add_dependency(%q<libxml-ruby>, [">= 0.9.2"])
  end
end
