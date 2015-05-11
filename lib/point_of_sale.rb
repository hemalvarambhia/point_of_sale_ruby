# -*- coding: utf-8 -*-
require 'product_catalogue'

class PointOfSale
  def initialize(display, product_catalogue = ProductCatalogue.new({}))
    @display = display
    @catalogue = product_catalogue
    @price = ""
  end

  def on_total
    if @price.empty?
      @display.no_sale_yet
    else
      @display.total @price
    end
  end

  def on_barcode barcode
    if barcode == nil || barcode.empty?
      @display.error "Barcode is invalid"
      return
    end

    if @catalogue.contains?(barcode)
      @price = price_from_catalogue barcode
      @display.print @price
    else
      @display.product_not_found
    end
  end

  private
  def price_from_catalogue(barcode)
    @catalogue.price_from_barcode(barcode)
  end
end
