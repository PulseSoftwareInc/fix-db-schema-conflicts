require 'shellwords'
require_relative '../autocorrect_configuration'

namespace :db do
  namespace :schema do
    task :dump do
      puts "Dumping database schema with fix-db-schema-conflicts gem"

      filename = ENV['SCHEMA'] || if defined? ActiveRecord::Tasks::DatabaseTasks
        File.join(ActiveRecord::Tasks::DatabaseTasks.db_dir, 'schema.rb')
      else
        "#{Rails.root}/db/schema.rb"
      end
      rubocop_yml = FixDBSchemaConflicts.rubocop_config
      `bundle exec rubocop --auto-correct --config #{rubocop_yml} #{filename.shellescape}`
    end
  end
end
