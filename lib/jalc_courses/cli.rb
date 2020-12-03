require_relative "version.rb"
require_relative "courses.rb"
require_relative "scraper.rb"
require 'pry'

class JalcCourses::CLI 
  
    puts ""
    puts "Hi. Below you will find the Fall 2020 course list at Jazz at Lincoln Center's Swing University! Registrations for individual classes are still being accepted!",""

    def go
      JalcCourses::Scraper.make_courses('https://jazzatlincolncenter.squarespace.com/swing-u')
      JalcCourses::Courses.display_courses
      puts ""
      puts "Please enter the number to the left of the course for more information."
      input = gets.strip.to_i
      get_course_info(input)
      puts ""
      puts "Would you like to view another artist? Enter: y or n.  Thank you.",""
      input_two = gets.strip.downcase
      view_another_course(input_two)
    end


    def valid_input(input) 
      if input >= 1 && input <=9
        true
      else
      puts "Please try again.",""
      go
      end
    end

    def get_course_info(input)
      if valid_input(input)
        puts "Title: #{JalcCourses::Courses.all[input - 1].title}",""
        puts "Date: #{JalcCourses::Courses.all[input - 1].date}",""
        puts "Description: #{JalcCourses::Courses.all[input - 1].description}",""
        puts "#{JalcCourses::Courses.all[input - 1].instructor}"
      end
    end

    def view_another_course(input_two)
      if input_two == "y"
        puts ""
        go
      elsif input_two == "n"
        puts "Have a wonderful day, and keep on Swingin!'",""
        exit
      else
        puts "Please try again"
        input_two = gets.strip.downcase
        view_another_course(input_two)
      end
    end

end
