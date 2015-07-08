class SaleController
  def initialize(display, catalogue)
    @display = display
    @catalogue = catalogue
  end

  def on_barcode barcode
    # SMELL: Should the method ever receive blank barcodes?
    if barcode.empty?
      @display.display_empty_barcode_message
      return
    end

    price = @catalogue.find_price barcode
    if price.nil?
      @display.display_product_not_found_message barcode
    else
      @display.display_price price
    end
  end
end