#
# Be sure to run `pod lib lint Aladin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Aladin'
  s.version          = '1.0.2'
  s.summary          = 'A short description of Aladin.'
  s.swift_version    = '5.1'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Aladin WebAPI'

  s.homepage         = 'https://github.com/ALADINIO/ios-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aladin' => '' }
  s.source           = { :git => 'https://github.com/ALADINIO/ios-sdk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Aladin/Classes/**/*'
  
   s.resource_bundles = {
       'Aladin' => ['Aladin/Javascript/*.js']
#     'Aladin' => ['Aladin/Assets/*.png']
   }

  s.dependency 'CryptoSwift', '0.15.0'
  s.dependency 'PromisesSwift'
  s.dependency 'STRegex'
end
