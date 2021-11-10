#
# Be sure to run `pod lib lint MasivPushIosSdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MasivPushIosSdk'
  s.version          = '0.3.4'
  s.summary          = 'MasivPushIosSdk Library'
  s.swift_version = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'This library was created for business logic of Ios Sdk for different services of Masiv'
                       DESC

  s.homepage         = 'https://masivPublicSdks@dev.azure.com/masivPublicSdks/MasivPushSdks/_git/MasivPushIosSdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'David Andres Vargas Leon' => 'david.vargas@masiv.com' }
  s.source           = { :git => 'https://masivPublicSdks@dev.azure.com/masivPublicSdks/MasivPushSdks/_git/MasivPushIosSdk', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.platform = :ios,"10.0"
  s.source_files = 'MasivPushIosSdk/Classes/**/*'
  s.module_name = "MasivPushIosSdk"
  # s.resource_bundles = {
  #   'MasivPushIosSdk' => ['MasivPushIosSdk/Assets/*.png']
  # }
  
  

  # s.public_header_files = 'Pod/Classes/**/*.h'
#  s.frameworks = 'UIKit', 'MapKit', 'FirebaseCore', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.static_framework = true
#  s.dependency 'Firebase/Core'
#  s.dependency 'FirebaseMessaging'
#  s.dependency 'FirebaseAnalytics'
#
#  s.pod_target_xcconfig = {
#      'FRAMEWORK_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/Firebase $(PODS_ROOT)/FirebaseCore/Frameworks '
#    }
  
end
