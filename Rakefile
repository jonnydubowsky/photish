lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Dir.glob('tasks/*.rake').each { |r| import r }

desc 'Test and gather metrics'
task :default => [:clean,
                  :test]

desc 'Create the various build files and packages'
task :pack    => [:clean,
                  :build,
                  :package]

desc 'Clean everything'
task :clean   => ['test:clean',
                  'build:clean',
                  'package:clean',
                  'metrics:clean']
