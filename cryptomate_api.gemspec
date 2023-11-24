# frozen_string_literal: true

require_relative "lib/cryptomate_api/version"

Gem::Specification.new do |spec|
  spec.name = "cryptomate_api"
  spec.version = CryptomateApi::VERSION
  spec.authors = ["Matias Albarello"]
  spec.email = ["matias.albarello@gmail.com"]
  spec.licenses = ["MIT"]

  spec.summary     = "Ruby client for the CryptoMate API."
  spec.description = "Provides a Ruby interface to the CryptoMate API, allowing easy access to cryptocurrency data and transaction operations. Supports retrieving currency details, creating and fetching transactions, and managing user information."
  spec.homepage = "https://github.com/matiasalbarello/cryptomate_api"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.18"
end
