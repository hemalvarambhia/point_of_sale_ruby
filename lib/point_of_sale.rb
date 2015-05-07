class PointOfSale
  def initialize display
    @display = display
  end

  def on_barcode barcode
    if barcode.empty?
      @display.set_text "Barcode is invalid"
    else
      @display.set_text find_in_catalogue(barcode)
    end
  end

  private
  def find_in_catalogue(barcode)
    catalogue = {
    	"123456" => "£1.50",
        "246810" => "£5.00"
    }

    catalogue.fetch(barcode, "Product not found")
  end
end