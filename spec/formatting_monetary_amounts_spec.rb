describe "Formatting monetary amounts" do
  def format(price_in_pence)
    "£7.89"
  end

  context "simplest amount" do
    [[789, "£7.89"]].each do |price_in_pence, expected_formatted_price|
      it "formats #{price_in_pence} as #{expected_formatted_price}" do
        expect(format(price_in_pence)).to eq(expected_formatted_price)
      end
    end
  end
end