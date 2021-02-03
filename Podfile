# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'NYTimesApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  def common_pods()
  pod 'RxSwift'
  pod 'Moya/RxSwift'
  pod 'AlamofireImage'
  pod 'JGProgressHUD'
  pod 'OHHTTPStubs/Swift', '~> 8.0.0'

  end
  
  use_frameworks!

  # Pods for NYTimesApp
  common_pods



  target 'NYTimesAppTests' do
    inherit! :search_paths
    # Pods for testing
    common_pods
    
    pod 'Quick'
    pod 'Nimble'
    pod 'RxTest'

  end

  target 'NYTimesAppUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '5.1'
            config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
    end
end
