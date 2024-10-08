WickedPdf.configure do |config|
  # Path to the wkhtmltopdf executable
  config.exe_path = Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf')

  # Enabling local file access for wkhtmltopdf to access assets
  config.enable_local_file_access = true

  # Default layout for PDF views
  config.layout = 'pdf.html'
end
