# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'HotMartTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Alamofire', '~> 5.2'
  
  target 'HotMartTestTests' do
    inherit! :search_paths
      pod 'Mockit', '1.5.0'
  end

end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = '$(inherited)'
        end
    end
end
