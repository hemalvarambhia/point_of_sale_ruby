class PointOfSale
  def initialize(display, catalog)
    @display = display
    @catalogue = catalog
  end

  def on_barcode barcode
    if barcode == nil || barcode.empty?
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