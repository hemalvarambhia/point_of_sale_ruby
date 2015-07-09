describe "Interpreting text commands" do
  class TextCommandInterpreter
    def initialize listener
      @listener = listener
    end
    def process stream
      line = stream.gets
      if line
        barcode = line.strip
        @listener.on_barcode(barcode)
      end
    end
  end
  
  context "no commands" do
    it "does nothing" do
      barcode_listener = double("BarcodeScannedListener")

      expect(barcode_listener).to_not receive(:on_barcode)

      TextCommandInterpreter.new(barcode_listener).process StringIO.new("")
    end
  end

  context "one barcode" do
    it "processes the barcode" do
      barcode_listener = double("BarcodeScannedListener")

      expect(barcode_listener).to receive(:on_barcode).with("::barcode::").once

      TextCommandInterpreter.new(barcode_listener).process StringIO.new("::barcode::\n")
    end
  end
end
