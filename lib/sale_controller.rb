class SaleController
  def initialize(display, catalogue)
    @display = display
    @catalogue = catalogue
  end

  def on_barcode barcode
    # SMELL: Should the method ever receive blank barcodes?
    if barcode.empty?
      @display.display_empty_barcode_message
      return SaleView.new
    end

    price = @catalogue.find_price barcode
    if price.nil?
      @display.display_product_not_found_message barcode
    else
      @display.display_scanned_product_price_message price
      return SaleView.new(
               "Scanned Product Price Message", 
               {"price" => price})
    end
 
    return SaleView.new
  end
end

class SaleView
  attr_reader :view_name, :placeholder_values

  def initialize(view_name = "", placeholder_values = {})
    @view_name = view_name 
    @placeholder_values = placeholder_values
  end
end