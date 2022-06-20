require_relative 'lib/order_processor/version'

Gem::Specification.new do |spec|
  spec.name          = 'order_processor'
  spec.version       = OrderProcessor::VERSION
  spec.authors       = ['umekaf']
  spec.email         = ['kafleumesh@gmail.com']

  spec.summary       = 'Order Processor'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = ['order_processor']
  spec.require_paths = ['lib']
end