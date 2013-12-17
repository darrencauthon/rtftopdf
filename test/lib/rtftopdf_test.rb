require 'test_helper'
require 'tempfile'

describe "rtf to pdf conversion" do
	describe "rtf to html conversion" do
    it "must turn rtf input into html" do
      rtf_input = '{\rtf1\ansi\ansicpg1252\deff0\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fprq2\fcharset0 Times New Roman;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\fnil Times New Roman;}{\f3\fswiss\fprq2\fcharset0 Arial;}}\viewkind4\uc1\pard\nowidctlpar\qr\b\f0\fs18 LOREM ISPO FACTO\par\pard\nowidctlpar\qc\f1\fs28 LOREM IPSEUM AGREEMENT\f0\fs18                                                                         \par}'
      temporary_rtf_file = Tempfile.new('RTF')
      temporary_rtf_file.write(rtf_input)
      temporary_rtf_file.close

      html_content = `unrtf #{temporary_rtf_file.path}`
      temporary_rtf_file.unlink

      PDFKit.expects(:new).with(html_content)

      RTFtoPDF.to_pdf(rtf_input)
  	end
    it "must delete the temporary file when its finished" do
      Tempfile.any_instance.expects(:unlink)
      RTFtoPDF.to_pdf("asdf")
    end
  end
	it "must pass on the html result to pdf kit" do
		RTF.any_instance.stubs(:to_html).returns("my html content!")

		PDFKit.expects(:new).with("my html content!")

    RTFtoPDF.to_pdf("bla bla /so-=1 RTF content")
	end
	it "must return the pdf result from pdfkit" do
	end
end