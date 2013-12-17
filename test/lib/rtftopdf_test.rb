require_relative '../test_helper'

describe "rtf to pdf conversion" do

	describe "rtf to html conversion" do

    it "must turn rtf input into html" do

      rtf_input = '{\rtf1\ansi\ansicpg1252\deff0\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fprq2\fcharset0 Times New Roman;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\fnil Times New Roman;}{\f3\fswiss\fprq2\fcharset0 Arial;}}\viewkind4\uc1\pard\nowidctlpar\qr\b\f0\fs18 LOREM ISPO FACTO\par\pard\nowidctlpar\qc\f1\fs28 LOREM IPSEUM AGREEMENT\f0\fs18                                                                         \par}'
      temporary_rtf_file = Tempfile.new('RTF')
      temporary_rtf_file.write(rtf_input)
      temporary_rtf_file.close

      html_content = `unrtf #{temporary_rtf_file.path}`
      temporary_rtf_file.unlink
      
      mock_pdfkit = mock() do
        expects(:to_pdf)
      end

      PDFKit.expects(:new).with(html_content).returns(mock_pdfkit)
      RTFtoPDF.to_pdf(rtf_input)

  	end
    #it "must delete the temporary file when its finished" do
      #Tempfile.any_instance.expects(:unlink)
      #RTFtoPDF.to_pdf("asdf")
    #end
  end

	it "must pass on the html result to pdf kit" do

    mock_pdfkit = Object.new
    mock_pdfkit.expects(:to_pdf)

		RTF.any_instance.stubs(:to_html).returns("my html content!")

		PDFKit.expects(:new).with("my html content!").returns(mock_pdfkit)
    RTFtoPDF.to_pdf("bla bla /so-=1 RTF content")

	end

	it "must return the pdf result from pdfkit" do

    PDFKit.any_instance.stubs(:to_pdf).returns("my pdf!")
    
    RTFtoPDF.to_pdf("00001").must_equal "my pdf!"

	end

end
