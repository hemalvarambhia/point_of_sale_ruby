require_relative '../lib/display'
describe "Formatting monetary amounts" do
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
        expect(Display.format(price_in_pence)).to eq(expected_formatted_price)
      end
    end
  end
end