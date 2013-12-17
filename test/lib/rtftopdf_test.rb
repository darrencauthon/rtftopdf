require 'test_helper'

describe "rtf to pdf conversion" do
	it "must turn rtf input into html" do

	end
	it "must pass on the html result to pdf kit" do
		RTF.any_instance.stubs(:to_html).returns("my html content!")

		PDFKit.expects(:new).with("my html content!")

    RTFtoPDF.to_pdf("bla bla /so-=1 RTF content")
	end
	it "must return the pdf result from pdfkit" do
	end
end