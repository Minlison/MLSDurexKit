Pod::Spec.new do |s|
  s.name         = "MLSDurexKit"
  s.version      = "1.0.0"
  s.summary      = "防止崩溃容错处理"
  s.description  = <<-DESC
  Hack并exchange系统方法，拦截崩溃，例如字典set nil 等
  DESC
  
  s.homepage     = "https://www.minlison.cn"
  s.license      = "MIT"
  s.author             = { "Minlison" => "yuanhang.1991@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Minlison/MLSDurexKit.git", :tag => "v#{s.version}" }
  s.requires_arc = true
  s.documentation_url = "https://www.minlison.cn"
  s.static_framework = true
  
  mrc_files = "Classes/MRC/*.{h,m}"
  s.subspec 'MRC' do |ss|
    ss.source_files = mrc_files
    ss.public_header_files = "Classes/MRC/*.h"
  end
  s.subspec 'Core' do |ss|
    ss.exclude_files = mrc_files
    ss.source_files  = "Classes/**/*.{h,m}"
    ss.public_header_files = "Classes/**/*.h"
  end
end
