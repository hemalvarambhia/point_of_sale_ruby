require_relative '../lib/display'
require_relative '../lib/point_of_sale'
describe "Point of Sale system" do
 context "when the barcode is invalid" do
  it "states the barcode is invalid" do
    display = Display.new
    point_of_sale = PointOfSale.new display
 
    point_of_sale.on_barcode ""

    expect(display.text).to eq("Barcode is invalid")
  end
 end

 context "when a product is found" do
   it "displays the product's price" do
     display = Display.new
     point_of_sale = PointOfSale.new display

     point_of_sale.on_barcode "123456"

     expect(display.text).to eq("£1.50")
   end
 end
end