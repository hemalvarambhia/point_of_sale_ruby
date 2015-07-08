require_relative "./sale_controller"
require_relative './english_language_console_display'
require_relative './in_memory_catalogue'
require_relative './price'

sale_controller = SaleController.new(
  EnglishLanguageConsoleDisplay.new, 
  InMemoryCatalogue.new({
   "12345" => Price.pence(795),
   "23456" => Price.pence(1250)
  })
)

sale_controller.on_barcode "12345"
sale_controller.on_barcode "23456"
sale_controller.on_barcode "99999"
sale_controller.on_barcode ""