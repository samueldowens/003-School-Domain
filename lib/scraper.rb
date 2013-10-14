class Scrape
  attr_accessor :student_page

  def initialize(student_page)
    @student_page = student_page
  end
 
  def get_name
    begin
     name = @student_page.css('.ib_main_header').children[0].text
    rescue
      "Waldo"
    end
  end

  def get_website
    begin
      website = @student_page.css('p:contains("Favorite Website")')[0].children[1].attributes["href"].value 
    rescue
      "http://www.flatironschool.com"
    end
  end

  def get_github
   ret_val = ""
   student_page.css('.social-icons a').select do |x|
      ret_val = x.attributes["href"].value if x.attributes["href"].value.include?("github") 
    end
      ret_val
  end

  def get_twitter
   ret_val = ""
   student_page.css('.social-icons a').each do |x|
      ret_val = x.attributes["href"].value if x.attributes["href"].value.include?("twitter") 
   end
      ret_val
  end


  def get_linkedin
   ret_val = ""
   student_page.css('.social-icons a').each do |x|
      ret_val = x.attributes["href"].value if x.attributes["href"].value.include?("linkedin") 
   end
      ret_val
  end

end
