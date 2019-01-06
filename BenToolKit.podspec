Pod::Spec.new do |s|
  s.name                  = "BenToolKit"
  s.version               = "0.0.2"
  s.summary               = "Tool kit"
  s.homepage              = "https://github.com/Beniamiiin/BenToolKit"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "Beniamin Sarkisian" => "beniamin.sarkisyan@gmail.com" }
  s.requires_arc          = true
  s.source                = { :git => "https://github.com/Beniamiiin/BenToolKit.git" }

  s.swift_version         = '4.2'
  s.ios.deployment_target = '8.0'

  s.subspec 'Constants' do |sp|
    sp.source_files = 'Sources/Constants/*.swift'
  end

  s.subspec 'TableView' do |sp|
    sp.source_files = 'Sources/TableView/**/*.swift'

    sp.dependency 'RxSwift'
    sp.dependency 'RxCocoa'
    sp.dependency 'RxDataSources'
  end

  s.subspec 'Extensions' do |sp|
    sp.source_files = 'Sources/Extensions/*.swift'

    sp.dependency 'BenToolKit/Constants'
  end

  s.subspec 'Extensions|DispatchQueue' do |sp|
    sp.source_files = 'Sources/Extensions/DispatchQueue+EasyApi.swift'

    sp.dependency 'BenToolKit/Constants'
  end

  s.subspec 'Extensions|UIAlertController' do |sp|
    sp.source_files = 'Sources/Extensions/UIAlertController+EasyApi.swift'
  end

  s.subspec 'Extensions|UITableView' do |sp|
    sp.source_files = 'Sources/Extensions/UITableView+Helpers.swift'

    sp.dependency 'BenToolKit/Constants'
  end

  s.subspec 'Extensions|UIView' do |sp|
    sp.source_files = 'Sources/Extensions/UIView+Helpers.swift'
  end

  s.subspec 'Extensions|IBInspectable' do |sp|
    sp.source_files = 'Sources/Extensions/UIView+IBInspectable.swift'
  end
end