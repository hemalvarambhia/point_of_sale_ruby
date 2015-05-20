# -*- coding: utf-8 -*-
require 'product_catalogue'

class PointOfSale
  def initialize(display, product_catalogue = ProductCatalogue.new({}, {}))
    @display = display
    @catalogue = product_catalogue
    @scanned_price = ""
  end

  def on_total
    sale_in_progress = @scanned_price.size > 0
    if sale_in_progress
      @display.total format_monetary_amount(@scanned_price)
    else
      @display.no_sale_yet
    end
  end

  def on_barcode barcode
    if barcode == nil || barcode.empty?
      @display.error "Barcode is invalid"
      return
    end

    if @catalogue.contains?(barcode)
      @scanned_price = price_from_catalogue barcode
      @display.print format_monetary_amount(@scanned_price)
    else
      @display.product_not_found
    end
  end

  private
  def price_from_catalogue(barcode)
    @catalogue.price_from_barcode(barcode)
  end

  def format_monetary_amount(price)
    price
  end
end
