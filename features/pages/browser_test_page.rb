class BrowserTestPage
    include Capybara::DSL
  
    def initialize
      @browser_table_xpath = "/html/body/div/center/table/tbody/tr/td[2]/table"
    end
  
    def on_browser_page?
      has_content?("All Browsers Are Not Created Equal")
    end
    def browsers_rows
      find(:xpath, @browser_table_xpath).all(:xpath, "tbody/tr")
    end
  
    def rows_have_information?
      rows = browsers_rows
      return false if rows.size <= 1
      rows.drop(1).all? do |row| 
        content = row.find(:xpath, ".//blink").text.strip
        !content.empty?
      end
    end
    def has_marquee?
        element=find(:xpath, "/html/body/p[1]/font/em/strong/marquee")
        element.text.strip
    end
  end
  