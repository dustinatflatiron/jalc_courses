require_relative "version.rb"
require_relative "courses.rb"


class JalcCourses::Scraper 
      def self.make_courses(site)
      doc = Nokogiri::HTML(open(site))
      doc.css('div.col.sqs-col-4.span-4').slice(2,10).each do |course|
        Courses.new(course.css('div.sqs-block-content h4').text, course.css('div.sqs-block-content h3').text,
          course.css('div.sqs-block-content p[1]').text, course.css('div.sqs-block-content p[2]').text)
      end
    end
end
