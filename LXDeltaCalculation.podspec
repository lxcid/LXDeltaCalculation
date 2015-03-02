Pod::Spec.new do |s|
  s.name             = "LXDeltaCalculation"
  s.version          = "0.0.1"
  s.summary          = "To calculate the differences between 2 collections. A clone of BKDeltaCalculator."
  s.description      = "To calculate the differences between 2 collections. A clone of BKDeltaCalculator."
  s.homepage         = "https://github.com/lxcid/LXDeltaCalculation"
  s.license          = 'MIT'
  s.author           = { "Stan Chang Khin Boon" => "me@lxcid.com", "Andrew Toulouse" => "andrew@atoulou.se" }
  s.source           = { :git => "https://github.com/lxcid/LXDeltaCalculation.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  
  s.subspec 'Core' do |ss|
    s.source_files = 'LXDeltaCalculation/LXDelta.{h,m}',
                     'LXDeltaCalculation/LXDeltaCalculator.{h,m}'
    s.public_header_files = 'LXDeltaCalculation/LXDelta.h',
                            'LXDeltaCalculation/LXDeltaCalculator.h'
    s.frameworks = 'Foundation'
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
