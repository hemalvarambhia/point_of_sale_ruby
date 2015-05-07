class PointOfSale
  def initialize display
    @display = display
  end

  def on_barcode barcode
    if barcode.empty?
     @display.set_text "Barcode is invalid"
    elsif barcode == "246810"
     @display.set_text "£5.00"
    elsif barcode == "123456"
     @display.set_text "£1.50"
    end
  end
end