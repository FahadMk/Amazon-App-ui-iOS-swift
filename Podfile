use_frameworks!
platform :ios, '9.0'

pod 'Cosmos', '~> 15.0' 
pod 'ImageSlideshow', '~> 1.8.3'

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end

target 'Amazon App' do
end