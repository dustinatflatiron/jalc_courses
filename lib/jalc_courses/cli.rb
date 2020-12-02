require_relative "version.rb"
require_relative "courses.rb"
require_relative "scraper.rb"

class JalcCourses::CLI 
  def go 
    puts "Hello there!"
    JalcCourses::Courses.test
    JalcCourses::Scraper.this_test
  end
end
