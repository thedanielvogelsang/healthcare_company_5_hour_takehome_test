desc 'cli command for quicker migration to test environment'
  task :migrate_test do
    Rake::Task["db:migrate"].invoke(`RAILS_ENV=test`)
  end
