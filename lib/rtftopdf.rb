require "rtftopdf/version"
require "pdfkit"

class RTF
	def initialize rtf_content

  end

  def to_html

  end
end

class RTFtoPDF
  def self.to_pdf rtf_content
    html_content = RTF.new(rtf_content).to_html
    pdf_content = PDFKit.new(html_content)
  end
end
