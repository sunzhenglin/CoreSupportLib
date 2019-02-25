#
# Be sure to run `pod lib lint CoreSupportLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CoreSupportLib'
  s.version          = '1.4.0'
  s.summary          = 'A short description of CoreSupportLib.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/sunzhenglin/CoreSupportLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'acct<blob>=0xE7A9BAE781B5E699BAE883BD' => '393992811@qq.com' }
  s.source           = { :git => 'https://github.com/sunzhenglin/CoreSupportLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CoreSupportLib/Classes/**/*.{h,m}'
  
   s.resource_bundles = {
     'CoreSupportLib' => ['CoreSupportLib/Classes/**/*.{png,xib}']
   }
 
    s.dependency 'LBXScan', '~> 2.3'
    s.dependency 'TXAdapter', '~> 0.0.2'
    s.dependency 'TXModel', '~> 1.0.1'
 
      
          
              
                  
                      
                      
end
