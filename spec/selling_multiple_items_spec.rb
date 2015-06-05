# -*- coding: utf-8 -*-
require_relative '../lib/product_catalogue'
require_relative '../lib/point_of_sale'
require_relative '../lib/display.rb'

describe "Selling multiple items" do
  context "selling no items" do
    it "tells the user that no sale made yet & to scan an item" do
      display = Display.new
      point_of_sale = PointOfSale.new display
      
      point_of_sale.on_total

      expect(display.text).to eq("No sale made yet. Begin by scanning an item.")
    end
  end

  context "selling one item" do
    context "when the item is found" do
      it "displays the total correctly" do
        display = Display.new
        catalogue = ProductCatalogue.new({"123456" => 650 })
        point_of_sale = PointOfSale.new(display, catalogue)

        point_of_sale.on_barcode "123456"
        point_of_sale.on_total
       
        expect(display.text).to eq("Total: £6.50")
      end
    end

    context "when the item is not found" do
      it "tells the user no sale has been made yet" do
         display = Display.new        
         point_of_sale = PointOfSale.new(display, ProductCatalogue.new({"123456" => 650}))
         point_of_sale.on_barcode "654321"

         point_of_sale.on_total

         expect(display.text).to eq("No sale made yet. Begin by scanning an item.")
      end
    end
  end
end
