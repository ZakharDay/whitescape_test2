class CenteringWrapperGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :layout_name, :type => :string, :default => "application"
  
  def generate_layout
    copy_file "centering_wrapper.css.scss", "app/assets/stylesheets/centering_wrapper.css.scss"
    template "layout.html.erb", "app/views/layouts/#{file_name}.html.erb"
  end
  
  private
  
  def file_name
    layout_name.underscore
  end
end
