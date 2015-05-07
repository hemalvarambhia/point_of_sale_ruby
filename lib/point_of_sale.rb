class PointOfSale
  def initialize display
    @display = display
  end

  def on_barcode barcode
    if barcode.empty?
     @display.set_text "Barcode is invalid"
    else
     @display.set_text "£1.50"
    end
  end
end