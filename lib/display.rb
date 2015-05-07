class Display
  attr_reader :text
  def initialize
    @text = ""
  end
  def set_text text
    @text = text
  end
end