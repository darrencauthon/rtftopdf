module RTFtoPDF

  class RTF

    def initialize rtf_content
      @rtf_content = rtf_content
    end

    def to_html
      TemporaryFile.within_a_file(@rtf_content) do |file|
        `unrtf #{file.path}`
      end
    end

  end

end
