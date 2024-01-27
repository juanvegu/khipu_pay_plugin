#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint khipu_pay_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'khipu_pay_plugin'
  s.version          = '2.0.0'
  s.summary          = 'Plugin Khipu Platform'
  s.description      = <<-DESC
Plugin to create payment identifiers, process payments and verify the status of a payment through the Khipu Platform.
                       DESC
  s.homepage         = 'https://github.com/juanvegu/khipu_pay_plugin'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'juanvegu' => 'juanvegu.dev@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'khenshin', '~> 1.754'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
