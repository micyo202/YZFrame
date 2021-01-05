Pod::Spec.new do |s|
    s.name         = 'YZFrame'
    s.version      = '1.3.0'
    s.summary      = 'YZFrame is an agile class library for development'
    s.homepage     = 'https://github.com/micyo202/YZFrame'
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.authors      = {'Yanzheng' => 'micyo202@163.com'}
    s.platform     = :ios, '12.0'
    s.ios.deployment_target = '12.0'
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.source       = {:git => 'https://github.com/micyo202/YZFrame.git', :tag => s.version}
    s.source_files = 'YZFrame/Core/**/*.{h,m}'
    s.resources    = 'YZFrame/Resources/*.bundle'
    s.requires_arc = true
    s.dependency 'YYKit'
    s.dependency 'MBProgressHUD'
    s.dependency 'SVProgressHUD'
end
