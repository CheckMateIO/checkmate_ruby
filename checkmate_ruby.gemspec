lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name  = "CheckmateRuby"
  s.version = "0.0.1"
  s.files = `git ls-files`.split("\n")
  s.summary = "A Ruby API wrapper for the Checkmate Partner API"
  s.authors = "Alex Katkova"
end
