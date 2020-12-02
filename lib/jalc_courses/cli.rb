require_relative "version.rb"
require_relative "courses.rb"
require_relative "scraper.rb"

class JalcCourses::CLI 

  def go
    puts "Hi. Below you will find the Fall 2020 course names at Jazz at Lincoln Center's Swing University! Registration for individual classes are still being accepted!"
    puts ""
    Scraper.make_courses('https://jazzatlincolncenter.squarespace.com/swing-u')
    Courses.display_courses
    puts ""
    puts "Please enter the number to the left of the course for more information."
    input = gets.strip.to_i
    get_course_info(input)
    puts ""
    puts "Would you like to view another artist? Enter: y or n.  Thank you."
    puts ""
    input_two = gets.strip.downcase
    view_another_course(input_two)
  end

end

def valid_input(input) #self
  if input >= 1 && input <=9
    true
  else
    puts "Please try again."
    puts ""
    Courses.display_courses #self
    input = gets.strip.to_i
    valid_input(input)
  end
end

def get_course_info(input) #self
  if valid_input(input) #self
    puts "Title: #{Courses.all[input - 1].title}"
    puts ""
    puts "Date: #{Courses.all[input - 1].date}"
    puts ""
    puts "Description: #{Courses.all[input - 1].description}"
    puts ""
    puts "#{Courses.all[input - 1].instructor}"
    puts ""
  end
end

def view_another_course(input_two) #self
  if input_two == "y"
    go #self
  elsif input_two == "n"
    puts "Have a wonderful day!"
    exit
  else
    puts "Please try again"
    input_two = gets.strip.downcase
    view_another_course(input_two) #self
  end

end
