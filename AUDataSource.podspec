#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "AUDataSource"
  s.version          = "0.1.0"
  s.summary          = "DataSouce object for UITableView and UICollectionView."
  s.homepage         = "http://www.appunite.com"
  s.license          = 'MIT'
  s.author           = { "emil.wojtaszek" => "emil@appunite.com" }
  s.source           = { :git => "https://github.com/appunite/AUDataSource.git", :tag => s.version.to_s }

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.subspec 'CollectionStorage' do |ss|
    ss.source_files = 'Classes/AUCollectionStorage'
  end

  s.subspec 'Categories' do |ss|
    ss.source_files = 'Classes/AUDataSource/Categories'
  end

  s.subspec 'Memory' do |ss|
    ss.dependency 'AUDataSource/Categories'
    ss.dependency 'AUDataSource/CollectionStorage'
    ss.source_files = 'Classes/AUDataSource', 'Classes/AUDataProvider/AUDataProvider.h', 'Classes/AUDataProvider/AUMemoryDataProvider.{h,m}'
  end

  s.subspec 'CoreData' do |ss|
    ss.ios.frameworks = 'CoreData'
    ss.dependency 'AUDataSource/Categories'
    ss.source_files = 'Classes/AUDataSource', 'Classes/AUCollectionStorage/AUCollectionUpdate.{h,m}', 'Classes/AUDataProvider/AUDataProvider.h', 'Classes/AUDataProvider/AUCoreDataProvider.{h,m}'
  end

  s.subspec 'All' do |ss|
    ss.dependency 'AUDataSource/Memory'
    ss.dependency 'AUDataSource/CoreData'
  end

  s.default_subspec = 'Memory'

end
