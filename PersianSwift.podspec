Pod::Spec.new do |s|
	s.name			= 'PersianSwift'
	s.version		= '1.7'
	s.summary		= 'PersianSwift adds Persian to Swift!'
	s.homepage		= 'https://github.com/omidgolparvar/PersianSwift'
	s.license		= { :type => 'MIT', :file => 'LICENSE.md' }
	s.description		= 'Using PersianSwift helps us to reduce coding.'
	s.author		= { 'Omid Golparvar' => 'iGolparvar@Gmail.com' }
	s.source		= { :git => 'https://github.com/omidgolparvar/PersianSwift.git', :tag => s.version.to_s }
	s.social_media_url	= 'https://twitter.com/omidgolparvar'
	s.ios.deployment_target	= '9.3'
	s.source_files		= 'Source/*.swift'
	s.pod_target_xcconfig	= { 'SWIFT_VERSION' => '4.0' }

end
