module Ckeditor
  module Version
    MAJOR = 3
    MINOR = 4
    RELEASE = 3

    def self.dup
      "#{MAJOR}.#{MINOR}.#{RELEASE}.pre"
    end
  end
end
