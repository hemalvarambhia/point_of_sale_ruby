shared_examples_for "any display" do
  it "displays an empty message" do
    expect(display).to respond_to :empty_barcode_message
  end

  it "displays a price" do
    expect(display).to respond_to :display_price
  end

  it "informs the user that a product was not found" do
    expect(display). to respond_to :product_not_found_message
  end
end