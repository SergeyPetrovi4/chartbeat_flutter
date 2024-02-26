#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
# Run `pod lib lint chartbeat_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'chartbeat_flutter'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin for integrating Chartbeat analytics.'
  s.description      = <<-DESC
A Flutter plugin for easily integrating Chartbeat analytics into your Flutter application, allowing for real-time user interaction and engagement tracking.
                       DESC
  s.homepage         = 'http://example.com' 
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Mirkan Caliskan' => 'mirkancaliskan@gmail.com' } 
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Chartbeat', '~> 1.5.0'
  s.platform         = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice. Exclude architecture if necessary.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version     = '5.0' # Ensure this matches the Swift version used in your project
end
