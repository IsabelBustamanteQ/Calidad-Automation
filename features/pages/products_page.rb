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
      expect(current_url).to include("##{section_name.downcase}")
      @current_position = @tableposition + 3
      element = find("body > h2:nth-child(#{@current_position})")
      expect(element.text.strip).to eq(@product)
      expect(element).to be_visible, "El elemento no está visible en la pantalla actual."
    end
  
    def see_unit_price(unit_price)
      @current_position = @tableposition + 5
      element = find("body > div:nth-child(#{@current_position}) > table > tbody > tr:nth-child(1) > td:nth-child(3)")
      expect(element.text.strip).to eq(unit_price.strip)
    end
  
    def see_item_number(item_number)
      @current_position = @tableposition + 5
      element = find("body > div:nth-child(#{@current_position}) > table > tbody > tr:nth-child(3) > td:nth-child(2)")
      expect(element.text.strip).to eq(item_number.strip)
    end
  end
  