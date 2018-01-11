Pod::Spec.new do |s|
  s.name             = 'Atom'
  s.version          = '0.1.0'
  s.summary          = 'Create Atomic (thread safe) values in swift. Improved version of objc.io Atomic'
  s.homepage         = 'https://github.com/vysotskiyserhiy/Atom.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Serhiy Vysotskiy' => 'vysotskiyserhiy@gmail.com' }
  s.source           = { :git => 'https://github.com/vysotskiyserhiy/Atom.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source_files = 'Atom/**/*'
end
