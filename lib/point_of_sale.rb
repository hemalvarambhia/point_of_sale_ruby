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
    end

    if @catalogue.contains?(barcode)
      display price_from_catalogue(barcode)
    else
      display_product_not_found
    end
  end

  private
  def price_from_catalogue(barcode)
    @catalogue.price_from_barcode(barcode)
  end

  def display price
    @display.set_text price
  end

  def display_product_not_found
    @display.set_text "Product not found"
  end
end
