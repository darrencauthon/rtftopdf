require "rtftopdf/rtf"
require "rtftopdf/temporary_file"
require "rtftopdf/version"
require 'tempfile'
require 'pdfkit'


module RTFtoPDF
  def self.to_pdf rtf_content
    html_content = RTF.parse(rtf_content).to_html
    pdf_content = PDFKit.new(html_content).to_pdf

    pdf_content
  end
end
