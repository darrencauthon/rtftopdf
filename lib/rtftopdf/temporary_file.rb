module RTFtoPDF

  module TemporaryFile

    def self.within_a_file content, &file_operation
      file = create_the_temporary_file_with content
      result = file_operation.call file
      file.unlink
      result
    end

    private

    def self.create_the_temporary_file_with content
      file = Tempfile.new('RTF')
      file.write content
      file.close
      file
    end

  end

end
