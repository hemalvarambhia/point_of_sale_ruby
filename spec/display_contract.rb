shared_examples_for "any display" do
  it "displays an empty message" do
    expect(display).to respond_to :display_empty_barcode_message
  end

  it "displays a price" do
    expect(display).to respond_to :display_scanned_product_price_message
  end

  it "informs the user that a product was not found" do
    expect(display). to respond_to :display_product_not_found_message
  end
end