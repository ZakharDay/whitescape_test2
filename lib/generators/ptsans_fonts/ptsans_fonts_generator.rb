class PtsansFontsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def copy_fonts
    copy_file "fonts.css.scss", "app/assets/stylesheets/fonts.css.scss"
    empty_directory "vendor/assets/fonts"
    copy_file "PTC55F.ttf", "vendor/assets/fonts/PTC55F.ttf"
    copy_file "PTC75F.ttf", "vendor/assets/fonts/PTC75F.ttf"
    copy_file "PTS55F.ttf", "vendor/assets/fonts/PTS55F.ttf"
    copy_file "PTS75F.ttf", "vendor/assets/fonts/PTS75F.ttf"
  end
  
  def generate_styles
    inject_into_file "app/assets/stylesheets/application.css.scss", "\n@import 'fonts.css.scss';", :after => "@import 'compass/reset';"
  end
end
