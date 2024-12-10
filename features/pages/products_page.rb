class ProductsPage
    include Capybara::DSL
  
    def initialize(product)
      @product = product
      @tableposition = set_product_position
    end
  
    def set_product_position
      case @product
      when '3 Person Dome Tent'
        return 0
      when 'External Frame Backpack'
        return 10
      when 'Glacier Sun Glasses'
        return 20
      when 'Padded Socks'
        return 30
      when 'Hiking Boots'
        return 40
      when 'Back Country Shorts'
        return 50
      else
        raise "Producto no reconocido"
      end
    end
    def see_section?(section_name)
        url_contains_section = current_url.include?("##{section_name.downcase}")
        @current_position = @tableposition + 3
        element = find("body > h2:nth-child(#{@current_position})")
        section_text_matches = element.text.strip == @product
      
        element_visible = element.visible?
        { url_contains_section: url_contains_section, section_text_matches: section_text_matches, element_visible: element_visible }
      end
      
  
    def get_unit_price
      @current_position = @tableposition + 5
      element = find("body > div:nth-child(#{@current_position}) > table > tbody > tr:nth-child(1) > td:nth-child(3)")
      element.text.strip
    end
  
    def get_item_number
      @current_position = @tableposition + 5
      element = find("body > div:nth-child(#{@current_position}) > table > tbody > tr:nth-child(3) > td:nth-child(2)")
      element.text.strip
    end
  end
  