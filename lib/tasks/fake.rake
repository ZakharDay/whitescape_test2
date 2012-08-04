namespace :db do
  desc 'Erase and fill database'
  task :fake => :environment do
    require 'faker'
    
    Rake::Task['db:reset'].invoke
    
    create_presenters
    create_tags
    create_seminars
    
    add_presenters_to_seminars
    add_tags_to_seminars
  end
end

def create_presenters
  50.times do |p|
    Presenter.create!(
      :name => Faker::Name.name, 
      :about => Faker::Lorem.paragraph)
  end
end

def create_tags
  100.times do |t|
    Tag.create!(:name => Faker::Address.city)
  end
end

def create_seminars
  1000.times do |s|
    Seminar.create!(
      :title => Faker::Lorem.sentence(word_count = 5),
      :body => Faker::Lorem.paragraph)
  end
end

def add_presenters_to_seminars
  4000.times do |p|
    # presenter_id = rand(1..50)
    # presentable_id = rand(1..1000)
    
    # presenter_id = random(1,50)::int
    # presentable_id = random(1,1000)::int
    
    presenter_id = Random.new.rand(1..50)
    presentable_id = Random.new.random(1..1000)
    
    Presenting.create(
      :presenter_id => presenter_id, 
      :presentable_id => presentable_id, 
      :presentable_type => 'Seminar')
  end
end

def add_tags_to_seminars
  4000.times do |t|
    # tag_id = rand(1..100)
    # taggable_id = rand(1..1000)
    
    # tag_id = random(1,100)::int
    # taggable_id = random(1,1000)::int
    
    tag_id = Random.new.random(1..100)
    taggable_id = Random.new.random(1..1000)
    
    Tagging.create(
      :tag_id => tag_id, 
      :taggable_id => taggable_id, 
      :taggable_type => 'Seminar')
  end
end