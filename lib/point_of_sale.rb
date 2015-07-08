# -*- coding: utf-8 -*-
require 'product_catalogue'

class PointOfSale
  def initialize(display, product_catalogue = ProductCatalogue.new({}))
    @display = display
    @catalogue = product_catalogue
    @scanned_item_prices_in_cents = []
  end

  def on_total
    sale_in_progress = @scanned_item_prices_in_cents.any?
    if sale_in_progress
      @display.total PointOfSale.purchase_total(@scanned_item_prices_in_cents)
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
      price_in_pence = @catalogue.find_price barcode
      @scanned_item_prices_in_cents << price_in_pence
      @display.display_price(price_in_pence)
    else
      @display.product_not_found
    end
  end

  def self.purchase_total(purchase_item_prices)
    purchase_item_prices.reduce(:+)
  end
end
