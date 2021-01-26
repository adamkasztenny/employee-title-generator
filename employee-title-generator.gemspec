require_relative 'app/version'

Gem::Specification.new do |spec|
  spec.name          = "employee-title-generator"
  spec.version       = EmployeeTitleGenerator::VERSION
  spec.authors       = ["Adam Kasztenny"]

  spec.summary       = "Generate vanity titles for your employees!"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["app"]
end
