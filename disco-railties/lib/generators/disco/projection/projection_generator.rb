require 'generators/disco/use_domain_option.rb'

module Disco
  module Generators
    class ProjectionGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      argument :events, type: :array, default: [], banner: 'event event'
      include UseDomainOption

      def create_projection_file
        template use_domain('projection.rb'), use_domain_class_file_path('projections', "#{file_name}_projection.rb")
      end

      def create_test_files
        template use_domain('projection_test.rb'), File.join('test/projections', use_domain_class_path, "#{file_name}_projection_test.rb")
      end
    end
  end
end
