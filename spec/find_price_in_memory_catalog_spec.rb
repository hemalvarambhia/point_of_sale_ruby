require 'price'
require 'in_memory_catalogue'
require 'shared_examples_for_catalogue'
describe InMemoryCatalogue do
  def catalogue_with(barcode, price)
    InMemoryCatalogue.new({
       "not #{barcode}" => Price.pence(50), 
       barcode => price,
       "again not #{barcode}" => Price.pence(2000)
      }
    )
  end

  def catalogue_without(barcode)
    InMemoryCatalogue.new({})
  end

  it_behaves_like "any catalogue"
end