class PointOfSale
  def initialize display
    @display = display
    @catalogue = {
      "123456" => "£1.50",
      "246810" => "£5.00"
    }
  end

  def on_barcode barcode
    if barcode.empty?
      @display.set_text "Barcode is invalid"
    else
      @display.set_text price_from_catalogue(barcode)
    end
  end

  private
  def price_from_catalogue(barcode)
    @catalogue.fetch(barcode, "Product not found")
  end
end