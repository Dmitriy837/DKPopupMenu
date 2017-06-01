#
# Be sure to run `pod lib lint DKPopupMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DKPopupMenu"
  s.version          = "0.3.0"
  s.summary          = "Simple Android-like popup menu"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
A fast and simple way to add Android-like looking popup menu anywhere in a project with API similar to UIAlertController, but simpler :)
It is now possible to set custom background view to customize color and handle gestures.
Optionally, any nib file can be used to present menu cell's content.
                       DESC

  s.homepage         = "https://github.com/Dmitriy837/DKPopupMenu"
  s.screenshots      = "https://raw.githubusercontent.com/Dmitriy837/DKPopupMenu/master/Demo/simple.jpg"
  s.license          = 'MIT'
  s.author           = { "DmytroKovryhin" => "agnostic.88@yandex.ua" }
  s.source           = { :git => "https://github.com/Dmitriy837/DKPopupMenu.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/DmitriyKovrihin'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.{h,m}'
  #s.resource_bundles = {
  #     'DKPopupMenu' => ['Pod/Assets/*.{png,storyboard,lproj}']
  # }
  s.resources = ['Pod/Assets/*.{png,storyboard,lproj}']

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
