class Student
  attr_accessor :name, :twitter, :linkedin, :github, :website
  attr_reader :id
 
    @@student_array = []

  def initialize(hash = {})
    @@student_array << self
    @name = hash[:name] 
    @twitter = hash[:twitter]
    @github = hash[:github]
    @linkedin = hash[:linkedin]
    @website = hash[:website]
    @id = @@student_array.length

    clean_up_name
  end

  def clean_up_name
    if @name.nil?
     @name = "Rosie Hoyem"
   elsif @name == "Student Name"
     @name = "Saron Yitbarek"
   end
  end
 
  def self.all
    @@student_array
  end
 
  def self.find(id)
    @@student_array.select { |s| s.id == id }.first
  end

 
  def self.reset_all
    @@student_array.clear
  end
 
  def self.find_by_name(name, array = @@student_array)
    @@student_array.select { |s| s.name.downcase == name.downcase }
  end
 
  def self.delete(id)
    user = self.find(id)
    index = @@student_array.index(user)
    @@student_array.delete_at(index)
  end
 
end
