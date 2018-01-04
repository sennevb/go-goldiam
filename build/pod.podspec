Pod::Spec.new do |spec|
  spec.name         = 'Ggol'
  spec.version      = '{{.Version}}'
  spec.license      = { :type => 'GNU Lesser General Public License, Version 3.0' }
  spec.homepage     = 'https://github.com/GoldiamTech/go-goldiam'
  spec.authors      = { {{range .Contributors}}
		'{{.Name}}' => '{{.Email}}',{{end}}
	}
  spec.summary      = 'iOS Goldiam Client'
  spec.source       = { :git => 'https://github.com/GoldiamTech/go-goldiam.git', :commit => '{{.Commit}}' }

	spec.platform = :ios
  spec.ios.deployment_target  = '9.0'
	spec.ios.vendored_frameworks = 'Frameworks/Ggol.framework'

	spec.prepare_command = <<-CMD
    curl https://ggolstore.blob.core.windows.net/builds/{{.Archive}}.tar.gz | tar -xvz
    mkdir Frameworks
    mv {{.Archive}}/Ggol.framework Frameworks
    rm -rf {{.Archive}}
  CMD
end
