Pod::Spec.new do |s|
  s.name         = "HMObjcSugar"
  s.version      = "0.0.6"
  s.summary      = "Objective-C 语法糖"
  s.homepage     = "https://github.com/itheima-developer/HMObjcSugar"
  s.license      = "MIT"
  s.author       =  { "Fan Liu" => "liufan321@gamil.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/itheima-developer/HMObjcSugar.git", :tag => "#{s.version}" }
  s.source_files  = "HMObjcSugar/ObjcSugar/*.{h,m}"
  s.requires_arc = true
end
