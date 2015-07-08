class Price
  def initialize(pence)
   @pence = pence
  end

  def self.pence pence
    Price.new pence
  end

  def self.in_pounds pence
    pence.to_f/100
  end

  def in_pounds
    @pence.to_f / 100
  end
end