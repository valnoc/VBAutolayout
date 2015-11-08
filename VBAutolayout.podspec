#
# Be sure to run `pod lib lint MyLib.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "VBAutolayout"
  s.version          = "2.0"
  s.summary          = "VBAutolayout is a library which makes programmatic autolayout creation comfortable, readable and code-minimized."
  s.description      = <<-DESC
There are developers (like me) who prefer to create UI programmatically due to numerous reasons. I use storyboards for segues and user scene-path. But UIViewControllers are left empty. And I do not use xibs.

When you create adaptive UI programmatically the view (or viewcontroller) code becomes unreadable because of big autolayout creation calls.

VBAutolayout is a library which makes programmatic autolayout creation comfortable, readable and code-minimized.
                       DESC
  s.homepage         = "https://github.com/valnoc/VBAutolayout"

  s.license          = 'MIT'
  s.author           = { "Valeriy Bezuglyy" => "valnocorner@gmail.com" }
  s.source           = { :git => "https://github.com/valnoc/VBAutolayout.git", :tag => "v#{s.version}" }

  s.platform     = :ios, '8.1'
  s.requires_arc = true

  s.source_files = 'VBAutolayout/**/*'

end
