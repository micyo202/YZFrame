Pod::Spec.new do |s|
    s.name         = 'YZFrame'
    s.version      = '1.0.0'
    s.summary      = 'YZFrame is an agile development libraries.'
    s.homepage     = 'https://github.com/micyo202/YZFrame'
    s.license      = {:type => 'MIT', :file => 'LICENSE'}
    s.authors      = {'Yanzheng' => 'micyo202@163.com'}
    s.platform     = :ios, '10.0'
    s.source       = {:git => 'https://github.com/micyo202/YZFrame.git', :tag => s.version}
    s.source_files = 'YZFrame/Core/**/*.{h,m}'
    s.resources    = 'YZFrame/Resources/*.bundle'
    s.requires_arc = true
    s.dependency 'AvoidCrash'
    s.dependency 'AFNetworking', '~> 3.0'
    s.dependency 'UIAlertController+Blocks'
    s.dependency 'CustomIOSAlertView', '~> 0.9.5'
    s.dependency 'LCActionSheet'
    s.dependency 'ActionSheetPicker-3.0'
    s.dependency 'MBProgressHUD', '~> 1.1.0'
    s.dependency 'JDStatusBarNotification'
    s.dependency 'YBPopupMenu', '~> 1.1.2'
    s.dependency 'MJRefresh'
    s.dependency 'YYKit'
    s.dependency 'SDWebImage', '~> 4.0'
    s.dependency 'SDCycleScrollView', '~> 1.75'
end
