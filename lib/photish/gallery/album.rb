module Photish
  module Gallery
    class Album
      include Traits::Urlable
      include Traits::Albumable
      include Plugin::Pluginable

      delegate :qualities,
               :image_extensions,
               :page_extension,
               :url_info,
               to: :parent,
               allow_nil: true

      def initialize(parent, path)
        super
        @parent = parent
        @path = path
      end

      def name
        @name ||= File.basename(path)
      end

      def photos
        @photos ||= child_files.select { |file| image_format?(file)   }
                               .map    { |file| Photo.new(self, file) }
      end

      def pages
        @pages ||=  child_files.select { |file| page_format?(file)   }
                               .map    { |file| Page.new(self, file) }
      end

      def plugin_type
        Plugin::Type::Album
      end

      private

      attr_reader :path,
                  :parent

      alias_method :base_url_name, :name

      def child_files
        @child_files ||= Dir.entries(path)
                            .reject { |file| ['.', '..'].include?(file) }
                            .map    { |file| File.join(path, file)      }
                            .select { |file| File.file?(file)           }
      end

      def image_format?(file)
        image_extensions.include?(extension(file))
      end

      def page_format?(file)
        page_extension == extension(file)
      end

      def extension(file)
        File.extname(file)
            .split('.')
            .last
            .try(:downcase)
      end

      def album_class
        self.class
      end

      def url_end
        'index.html'
      end
    end
  end
end
