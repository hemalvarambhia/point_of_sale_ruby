describe "Interpreting text commands" do
  class TextCommandInterpreter
    def process stream
    end
  end
  context "no commands" do
    it "does nothing" do
      barcode_listener = double("BarcodeScannedListener")

      expect(barcode_listener).to_not receive(:barcode_scanned)

      TextCommandInterpreter.new.process StringIO.new("")
    end
  end
end
