require "rake/testtask"

Rake::TestTask.new(:test => "db:test:prepare") do |t|
  #t.libs << "lib"
  t.libs << "test"
  #t.test_files = FileList['test/**/_test.rb']
  t.pattern = "test/**/*_test.rb"
end

task :default => :test