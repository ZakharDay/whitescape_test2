class PreparationGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def remove_regular_files
    remove_file "app/assets/stylesheets/application.css"
    remove_file "app/assets/images/rails.png"
    remove_file "public/index.html"
    remove_file "public/favicon.ico"
  end
  
  def generate_stylesheets
    copy_file "application.css.scss", "app/assets/stylesheets/application.css.scss"
    copy_file "mixins.scss", "app/assets/stylesheets/mixins.scss"
  end
  
  def generate_compass
    inject_into_file "Gemfile", "\n  gem 'compass-rails'\n", :after => "group :assets do"
  end
  
  def run_bundle
    say_status :run, "bundle install"
  end
  
  def init_compass
    say_status :run, "bundle exec compass init"
  end
end
