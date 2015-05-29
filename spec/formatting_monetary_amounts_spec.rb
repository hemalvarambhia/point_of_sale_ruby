describe "Formatting monetary amounts" do
  def format(price_in_pence)
    price = "%.2f" % (price_in_pence.to_f/100.0)
    pounds, pence = price.split('.')
    pounds = pounds.reverse.scan(/\d{1,3}/).join(",").reverse
    price = "£#{pounds}.#{pence}"
     
    price
  end

  context "simplest amount" do
    [
       [789, "£7.89"], 
       [520, "£5.20"], 
       [400, "£4.00"], 
       [0, "£0.00"], 
       [2, "£0.02"],
       [37, "£0.37"],
       [418976, "£4,189.76"],
       [210832281, "£2,108,322.81"]
    ].each do |price_in_pence, expected_formatted_price|
      it "formats #{price_in_pence} as #{expected_formatted_price}" do
        expect(format(price_in_pence)).to eq(expected_formatted_price)
      end
    end
  end
end