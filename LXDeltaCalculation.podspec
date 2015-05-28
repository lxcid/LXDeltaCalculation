Pod::Spec.new do |s|
  s.name             = 'LXDeltaCalculation'
  s.version          = '0.0.2'
  s.summary          = 'To calculate the differences between 2 collections. A clone of BKDeltaCalculator.'
  s.description      = <<-description
  LXDeltaCalculation is a clone of Basket/BKDeltaCalculator. Much of the programming interface was adopted from BKDeltaCalculator but with the following changes:

  - The diff'ing algorithm is different. The main difference is that BKDeltaCalculator will report move changes caused by insertions, while LXDeltaCalculation aim to find those that are have truely moved.
  - The default equality uses `isEqual:` instead of `==`.

  Many thanks to BKDeltaCalculator for laying the ground work. Finding a good generalized interface is not easy, much credit to them.

  The reason I did not fork but instead clone and rename the project is because I recognize that there are valid use cases for BKDeltaCalculator diff'ing algorithm, while LXDeltaCalculation is aim to be more compatible with UIKit and ASDisplayKit. A seperate project means I could use both project side by side.
  description
  s.homepage         = 'https://github.com/lxcid/LXDeltaCalculation'
  s.license          = { type: 'MIT' }
  s.author           = { 'Stan Chang Khin Boon' => 'me@lxcid.com' }
  s.source           = { git: 'https://github.com/lxcid/LXDeltaCalculation.git', tag: s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.subspec 'Core' do |ss|
    ss.source_files = 'LXDeltaCalculation/LXDelta.{h,m}',
                     'LXDeltaCalculation/LXDeltaCalculator.{h,m}'
    ss.public_header_files = 'LXDeltaCalculation/LXDelta.h',
                            'LXDeltaCalculation/LXDeltaCalculator.h'
    ss.frameworks = 'Foundation'
  end
  s.subspec 'UIKit' do |ss|
    ss.dependency 'LXDeltaCalculation/Core'
    ss.source_files = 'LXDeltaCalculation/LXDelta+UITableView.{h,m}'
    ss.public_header_files = 'LXDeltaCalculation/LXDelta+UITableView.h'
    s.frameworks = 'UIKit'
  end
  s.subspec 'All' do |ss|
    ss.dependency 'LXDeltaCalculation/Core'
    ss.dependency 'LXDeltaCalculation/UIKit'
    ss.source_files = 'LXDeltaCalculation/LXDeltaCalculation.h'
    ss.public_header_files = 'LXDeltaCalculation/LXDeltaCalculation.h'
  end
  s.default_subspec = 'All'
end
