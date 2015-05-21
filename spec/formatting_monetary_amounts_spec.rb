describe "Formatting monetary amounts" do
  def format(price_in_pence)
    "£7.89"
  end

  context "simplest amount" do
    it "formats the amount correctly" do
      expect(format(789)).to eq("£7.89")
    end
  end
end