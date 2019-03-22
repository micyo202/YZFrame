Pod::Spec.new do |s|
    s.name         = 'YZFrame'
    s.version      = '1.0.0'
    s.summary      = 'YZFrame is an agile class library for development'
    s.homepage     = 'https://github.com/micyo202/YZFrame'
    s.license      = 'MIT'
    s.authors      = {'Yanzheng' => 'micyo202@163.com'}
    s.platform     = :ios, '10.0'
    s.source       = {:git => 'https://github.com/micyo202/YZFrame.git', :tag => s.version}
    s.source_files = 'YZFrame/Core/**/*.{h,m}'
    s.resources    = 'YZFrame/Resources/*.bundle'
    s.requires_arc = true
    s.dependency   = 'MBProgressHUD', '~> 1.1.0'
end
