require 'product_catalogue'

class PointOfSale
  def initialize(display, product_catalogue = ProductCatalogue.new({}))
    @display = display
    @catalogue = product_catalogue
  end

  def on_total
    @display.no_sale_yet
  end

  def on_barcode barcode
    if barcode == nil || barcode.empty?
      @display.error "Barcode is invalid"
      return
    end

    if @catalogue.contains?(barcode)
      @display.print price_from_catalogue(barcode)
    else
      @display.product_not_found
    end
  end

  private
  def price_from_catalogue(barcode)
    @catalogue.price_from_barcode(barcode)
  end
end
