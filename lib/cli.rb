require_relative 'student.rb'
require_relative 'scraper.rb'

class CommandLine
 
  def initialize
    @on = true
    greeting
  end
 
  def on?
    @on
  end
 
  def browse
    puts "Here is the index of students in the jungle."
    Student.all.each { |student| puts "#{student.id}. #{student.name}"  }
  end
 
  def show
    puts "Enter a Student's full name or ID number."
    input = gets.chomp.downcase
 
    if input.to_i > 0
     output = Student.find(input.to_i)
    else
     output = Student.find_by_name(input)
    end
    puts "\nName: " + output.name if output.name != nil
    puts "Twitter: #{output.twitter}" if output.twitter != nil
    puts "Github: #{output.github}" if output.github != nil
    puts "LinkedIn: #{output.linkedin}" if output.linkedin != nil 
    puts "Website: #{output.website}" if output.website != nil
  end
 
  def help
    puts "\nThe jungle is a rough place, you get eaten by a wild #{["Spencer", "Scott", "John"].shuffle.first}, gotta watch out for those TAs. \n"
  end
 
  def greeting
    puts "\nWelcome to the Jungle... Of Flatiron Students.\n"
    puts "If you need to see the list of students, type 'browse'"
    puts "If you wish to see data on a specific student, type 'show'"
    puts "If you wish to leave the jungle, type 'exit'"
    puts "If you are lost in the jungle, type 'help'"
 
    while @on
      puts "\nYou're stuck in the jungle, what do you want to do? \n"
      input = gets.chomp.downcase
      case input
      when "browse"
        browse
      when "show"
        show
      when "exit"
        exit
      when "help"
        help
      else
          puts "\nYou got eaten by a wild Avi. Lose one life. Please try again.\n"
      end
    end
  end
 
end