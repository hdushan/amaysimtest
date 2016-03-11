require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:test) do |t|
  t.cucumber_opts = "features --tags ~@ignore --format pretty --format html --out results.html"
end

task :headless do
  ENV['BROWSER'] = "phantomjs"
  Rake::Task['test'].invoke
end

task :chrome do
  ENV['BROWSER'] = "chrome"
  Rake::Task['test'].invoke
end

task :firefox do
  ENV['BROWSER'] = "firefox"
  Rake::Task['test'].invoke
end

task :default => [:firefox]

