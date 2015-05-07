class PointOfSale
  def initialize display
    @display = display
  end

  def on_barcode barcode
    @display.set_text "Barcode is invalid"
  end
 
end