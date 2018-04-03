require 'fix_db_schema_conflicts/schema_dumper'
require 'fix_db_schema_conflicts/autocorrect_configuration'

require 'fix_db_schema_conflicts/railtie' if defined?(Rails)

module FixDBSchemaConflicts
  class << self
    def rubocop_config=(config_path)
      @rubocop_config = config_path
    end

    def rubocop_config
      @rubocop_config || default_config
    end

    def default_config
      relative_path = AutocorrectConfiguration.load
      File.expand_path("../#{relative_path}", __dir__)
    end
  end
end
