#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'meiqiachat'
  s.version          = '1.1.1'
  s.summary          = 'meiqia sdk init and to chat'
  s.description      = <<-DESC
  首次创建plugin并上传。
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'loself' => 'loselfmin@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'Meiqia', '~> 3.8.4'

  s.ios.deployment_target = '10.0'
end

