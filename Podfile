# Uncomment the next line to define a global platform for your project
source 'https://cdn.cocoapods.org/'
platform :ios, '11.0'
inhibit_all_warnings!
install! 'cocoapods',
  :warn_for_unused_master_specs_repo => false

target 'CleanArchitectureRxSwift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'RxCocoa', '~> 6.5.0'
  pod 'RxSwift', '~> 6.5.0'
  pod 'QueryKit'
  pod 'Alamofire'
  pod 'RxAlamofire'
  
  # Local pod
  pod 'ListPost', :path => 'Modules/ListPost'
  pod 'Domain', :path => 'Modules/Domain'
  pod 'NetworkPlatform', :path => 'Modules/NetworkPlatform'

end
