require 'test_helper'

describe "rtf to pdf conversion" do
	it "must turn rtf input into html" do

	end
	it "must pass on the html result to pdf kit"
		RTF::body("something").stubs(:to_html).returns("my html content!")
		PDFKit.
	end
	it "must return the pdf result from pdfkit" do
	end
end