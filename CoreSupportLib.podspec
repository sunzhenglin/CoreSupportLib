#
# Be sure to run `pod lib lint CoreSupportLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CoreSupportLib'
  s.version          = '1.3.5'
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

  s.ios.deployment_target = '9.0'

  s.source_files = 'CoreSupportLib/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CoreSupportLib' => ['CoreSupportLib/Assets/*.png']
  # }

  #  s.public_header_files = 'CoreSupportLib/Classes/CoreSupport.h'
#
##----------文件分级----------#
#  s.subspec 'CoreCategory' do |ss|
# 
#    ss.source_files = 'CoreSupportLib/Classes/**/*'
#     ss.public_header_files = 'CoreSupportLib/CoreCategory/CoreCategoryConfig.h'
#    end
#
#s.subspec 'CoreData' do |ss|
#  ss.source_files = 'CoreSupport/Classes/CoreData/**/*'
#    ss.public_header_files = 'CoreSupport/Classes/CoreData/CoreDataConfig.h'
#end
#s.subspec 'CoreMacros' do |ss|
#  ss.source_files = 'CoreSupport/Classes/CoreMacros/**/*'
#    ss.public_header_files = 'CoreSupport/Classes/CoreMacros/CoreMacrosConfig.h'
#end
#s.subspec 'CoreNetworking' do |ss|
#  ss.source_files = 'CoreSupport/Classes/CoreNetworking/**/*'
#    ss.public_header_files = 'CoreSupport/Classes/CoreNetworking/CoreNetworkingConfig.h'
#end
#s.subspec 'CoreRouter' do |ss|
#  ss.source_files = 'CoreSupport/Classes/CoreRouter/**/*'
#    ss.public_header_files = 'CoreSupport/Classes/CoreRouter/CoreRouterConfig.h'
#end
#s.subspec 'CoreTool' do |ss|
#  ss.source_files = 'CoreSupport/Classes/CoreTool/**/*'
#    ss.public_header_files = 'CoreSupport/Classes/CoreTool/CoreToolConfig.h'
##  #----------文件分级2----------#
##  ss.subspec 'JJImagePicker' do |sss|
##    sss.source_files = 'CoreSupport/Classes/CoreTool/JJImagePicker/*.{h,m}'
##  end
##  ss.subspec 'TXCleanCache' do |sss|
##    sss.source_files = 'CoreSupport/Classes/CoreTool/TXCleanCache/*.{h,m}'
##  end
##  ss.subspec 'TXImageCompressor' do |sss|
##    sss.source_files = 'CoreSupport/Classes/CoreTool/TXImageCompressor/*.{h,m}'
##  end
##  ss.subspec 'TXTimer' do |sss|
##    sss.source_files = 'CoreSupport/Classes/CoreUIKit/TXTimer/*.{h,m}'
##  end
#
#end
#
#s.subspec 'CoreVender' do |ss|
#  ss.source_files = 'CoreSupport/Classes/CoreVender/**/*'
#  ss.public_header_files = 'CoreSupport/Classes/CoreTool/CoreVenderConfig.h'
#  
#end

 
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'AFNetworking', '~> 3.2.1'
#    s.dependency 'MJRefresh', '~> 3.1.15.7'
#    s.dependency 'SDWebImage', '~> 4.4.3'
     s.dependency 'SVProgressHUD', '~> 2.2.5'
     s.dependency 'LBXScan', '~> 2.3'
#    s.dependency 'IQKeyboardManager', '~> 6.2.0'
    s.dependency 'TXAdapter', '~> 0.0.2'
     s.dependency 'TXModel', '~> 1.0.1'

#    s.dependency 'EBBannerView', '~>1.0.7'
 
#    s.dependency 'ReactiveCocoa', '~> 8.0.2'
#    s.dependency 'ReactiveObjC', '~> 3.1.0'
#    s.dependency 'JSONModel', '~> 1.4.0'

#    s.dependency 'Masonry'
#    s.dependency 'SDAutoLayout', '~> 2.1.3'

      
          
              
                  
                      
                      
end
