#
# Be sure to run `pod lib lint EDataSource.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EDataSource'
  s.version          = '1.2'
  s.summary          = 'Helper classes to manage your UI data sources'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Some Utility classes to make you table view management easier. Appliying Stratergy desing patter to the data source management creates a simple and clean way to use them.
                       DESC

  s.homepage         = 'https://github.com/borjaigartua/EDataSource'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'borjaigartua' => 'borjaigartua@gmail.com' }
  s.source           = { :git => 'https://github.com/borjaigartua/EDataSource.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_versions = ['3.0', '4.0', '4.2']

  s.source_files = 'EDataSource/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EDataSource' => ['EDataSource/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.frameworks = 'UIKit'
end
