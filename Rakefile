require 'bundler/gem_tasks'
require 'rake/testtask'

task :default => :spec

Rake::TestTask.new do |t|
  t.test_files = FileList['spec/lib/mattermost/*_spec.rb']
  t.verbose = true
end

task :default => :test