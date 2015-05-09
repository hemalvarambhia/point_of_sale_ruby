require 'product_catalogue'

class PointOfSale
  def initialize(display, product_catalogue = ProductCatalogue.new({}))
    @display = display
    @catalogue = product_catalogue
  end

  def on_barcode barcode
    if barcode == nil || barcode.empty?
      @display.set_text "Barcode is invalid"
      return

    if @catalogue.contains?(barcode)
      @display.set_text price_from_catalogue(barcode)
    else
      @display.set_text "Product not found"
    end
  end

  private
  def price_from_catalogue(barcode)
    @catalogue.price_from_barcode(barcode)
  end
end
