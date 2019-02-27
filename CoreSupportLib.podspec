#
# Be sure to run `pod lib lint CoreSupportLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CoreSupportLib'
  s.version          = '1.4.3'
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

 
 
 s.public_header_files = 'CoreSupportLib/Classes/CoreSupport.h'
 s.source_files = 'CoreSupportLib/Classes/CoreSupport.h'
 
 s.subspec 'CoreBundle' do |ss|
   #'CoreBundle'
   ss.public_header_files = 'CoreSupportLib/Classes/CoreBundle/**/*.h'
   ss.source_files = 'CoreSupportLib/Classes/CoreBundle/**/*.{h,m}'
   
 end
 s.subspec 'CoreCategory' do |ss|
   #'CoreCategory'
   ss.public_header_files = 'CoreSupportLib/Classes/CoreCategory/**/*.h'
   ss.source_files = 'CoreSupportLib/Classes/CoreCategory/**/*.{h,m}'
   
 end
 s.subspec 'CoreMacros' do |ss|
   #'CoreMacros'
   ss.public_header_files = 'CoreSupportLib/Classes/CoreMacros/**/*.h'
   ss.source_files = 'CoreSupportLib/Classes/CoreMacros/**/*.{h,m}'
   
 end
 s.subspec 'CoreRouter' do |ss|
   #'CoreRouter'
   ss.public_header_files = 'CoreSupportLib/Classes/CoreRouter/**/*.h'
   ss.source_files = 'CoreSupportLib/Classes/CoreRouter/**/*.{h,m}'
   
 end
          
              
                  
                      
                      
end
