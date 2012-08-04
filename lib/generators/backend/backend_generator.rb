class BackendGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :username, :type => :string, :default => "login"
  argument :password, :type => :string, :default => "pwd"
  
  def create_folders
    empty_directory "app/assets/images/backend"
    empty_directory "app/assets/javascripts/backend"
    empty_directory "app/assets/stylesheets/backend"
    empty_directory "app/controllers/backend"
    empty_directory "app/views/backend"
    empty_directory "app/views/layouts/backend"
  end
  
  def copy_files
    copy_file "application.css.scss", "app/assets/stylesheets/backend/application.css.scss"
    copy_file "application.html.erb", "app/views/layouts/backend/application.html.erb"
  end
  
  def generate_controller
    template "application_controller.rb", "app/controllers/backend/application_controller.rb"
  end
  
  def generate_routes
    inject_into_file "config/routes.rb", "\n\n  namespace :backend do\n  end\n", :after => "Application.routes.draw do"
  end
end
