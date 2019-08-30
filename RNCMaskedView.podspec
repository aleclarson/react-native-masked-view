require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNCMaskedView"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platform     = :macos, "10.5"

  s.source       = { :git => "https://github.com/react-native-community/react-native-masked-view.git", :tag => "v#{s.version}" }
  s.source_files  = "macos/**/*.{h,m}"

  s.dependency 'React'
end
