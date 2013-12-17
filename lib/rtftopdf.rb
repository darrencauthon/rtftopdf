require "rtftopdf/version"
require 'tempfile'
require 'pdfkit'

class RTF
  def initialize rtf_content
    @rtf_content = rtf_content
  end

  def to_html
    temporary_rtf_file = Tempfile.new('RTF')
    temporary_rtf_file.write(@rtf_content)
    temporary_rtf_file.close

    html_content = `unrtf #{temporary_rtf_file.path}`
    temporary_rtf_file.unlink

    html_content
  end
end

module RTFtoPDF
  def self.to_pdf rtf_content
    html_content = RTF.new(rtf_content).to_html
    pdf_content = PDFKit.new(html_content).to_pdf

    pdf_content
  end
end
