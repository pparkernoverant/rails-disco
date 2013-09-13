require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'
module Drails
  module Generators
    class ControllerGenerator < Rails::Generators::ScaffoldControllerGenerator
      source_root File.expand_path('../templates', __FILE__)
      hide!
      remove_hook_for :test_framework

      def create_test_files
        template "controller_test.rb", File.join("test/controllers", controller_class_path, "#{controller_file_name}_controller_test.rb")
      end

      private
      def params_string
        attributes.map { |x| "#{x.name}: params[:#{singular_table_name}][:#{x.name}]" }.join(', ')
      end
    end
  end
end