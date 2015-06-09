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

  context "all items not found" do
    it "tells the user no sale has been made yet" do
       display = Display.new
       point_of_sale = PointOfSale.new(display, catalogue_without_barcodes(
          "654321", "235711", "246810"))
       point_of_sale.on_barcode "654321"
       point_of_sale.on_barcode "235711"
       point_of_sale.on_barcode "246810"

       point_of_sale.on_total

       expect(display.text).to eq("No sale made yet. Begin by scanning an item.")
    end

    private
    def catalogue_without_barcodes(*barcodes)
     ProductCatalogue.new({})
    end
  end

  context "all items found" do
    it "displays the total cost of the items scanned" do
       display = Display.new
       point_of_sale = PointOfSale.new(display, ProductCatalogue.new(
          "654321"=> 200, "235711" => 350, "246810" => 100))
       point_of_sale.on_barcode "654321"
       point_of_sale.on_barcode "235711"
       point_of_sale.on_barcode "246810"

       point_of_sale.on_total

       expect(display.text).to eq("Total: £6.50")
    end
  end
end
