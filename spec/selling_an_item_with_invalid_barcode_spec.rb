# -*- coding: utf-8 -*-
require_relative '../lib/product_catalogue'
require_relative '../lib/point_of_sale'
require_relative '../lib/display'
describe "Selling an item with an invalid barcode" do
 before :each do
   @display = Display.new
   product_catalogue = ProductCatalogue.new({})
   @point_of_sale = PointOfSale.new(@display, product_catalogue)
 end

 context "when the barcode is blank" do
  it "states the barcode is invalid" do
    @point_of_sale.on_barcode ""

    expect(@display.text).to eq("Barcode is invalid")
  end
 end

 context "when the barcode is null" do
  it "states the barcode is invalid" do
   @point_of_sale.on_barcode nil

   expect(@display.text).to eq("Barcode is invalid")
  end
 end
end 
