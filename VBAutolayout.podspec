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
  s.version          = "2.0.1"
  s.summary          = "VBAutolayout is a library which makes programmatic autolayout creation comfortable, readable and code-minimized."
  s.description      = <<-DESC
There are developers (like me) who prefer to create UI programmatically due to numerous reasons. I use storyboards for segues and user scene-path. But UIViewControllers are left empty. And I do not use xibs.

When you create adaptive UI programmatically the view (or viewcontroller) code becomes unreadable because of big autolayout creation calls.

VBAutolayout is a library which makes programmatic autolayout creation comfortable, readable and code-minimized.

Format

Views layout is described in a dictionary with special VBAutolayout format. Constraints are created only for VBAutolayoutAttribute-s contained in layout dictionary. Attribute is ignored if no VBAutolayoutConstant value was given.

Layout dictionary format:

    @{VBAutolayoutAttribute: <1>,
      VBAutolayoutAttribute: <2>,
      VBAutolayoutAttribute: <3>
    }

    <1> =  <const>

    <2> =  @{VBAutolayoutItem: <item>,
             VBAutolayoutConstant: <const>}

    <3> =  @[<1>, <2>, ...]

<item> is a view2 in constraint. If no <item> specified, then superview is used and constraint is interpreted as a constraint to view container.

<const> is a string with the same format as could be used for Visual Format Constraints Creation

    <const> = <relation><constant>@<priority>, ex. 10, ==10, >=10, <=10, 10@999, >=10@999, etc.
    <relation> =    1) <, <= for <=
                    2) >, >= for >=
                    3) =, == for ==

Several constraints can be combined for one attribute using variant <3>.

Examples,

- distance greater or equal then 10 from item top to someView bottom with 999 priority
    VBAutolayoutAttributeTop: @{VBAutolayoutItem: __someView__,`
                                VBAutolayoutConstant: @">=10@999"}`
- distance equal to 0 from item leading to someView trailing
    VBAutolayoutAttributeLeading: @{VBAutolayoutItem: __someView__}
- distance equal to 0 from item leading to container leading
    VBAutolayoutAttributeLeading: @"0"

                       DESC
  s.homepage         = "https://github.com/valnoc/VBAutolayout"

  s.license          = 'MIT'
  s.author           = { "Valeriy Bezuglyy" => "valnocorner@gmail.com" }
  s.source           = { :git => "https://github.com/valnoc/VBAutolayout.git", :tag => "v#{s.version}" }

  s.platform     = :ios, '8.1'
  s.requires_arc = true

  s.source_files = 'VBAutolayout/**/*'

end
