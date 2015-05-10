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

end
