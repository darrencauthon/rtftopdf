module RTFtoPDF

  class RTF

    attr_accessor :content

    def self.parse content
      rtf = new
      rtf.content = content
      rtf
    end

    def to_html
      TemporaryFile.within_a_file(content) do |file|
        `unrtf #{file.path}`
      end
    end

  end

end
