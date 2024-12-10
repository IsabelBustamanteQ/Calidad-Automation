class AboutThisSitePage
    include Capybara::DSL
  
    def initialize
      @technologies_table_xpath = "/html/body/div/center/table"
      @description = "This is a sample online commerce application. It is not real. Green Mountain Outpost is a fictitious company. Any resemblance to actual companies, either living or dead, is purely coincidental."
    end
  
    def on_about_this_site_page?
      has_content?("About This Site") && has_content?(@description)
    end

    def has_warning_message?(message)
        has_content?(message)
      end
  
    def technologies_rows
      find(:xpath, @technologies_table_xpath).all(:xpath, "tbody/tr")
    end
  
    def rows_have_information?
      rows = technologies_rows
      return false if rows.size <= 1
      rows.drop(1).all? do |row| 
        technology_name = row.find(:xpath, "td[1]/blockquote/ul/li[1]/font").text.strip
        !technology_name.empty?
      end
    end
  end
  