module Flixated
  class Client
    private
      def sanitize_path(path)
        if path.include? '?'
          if path.match /\?$/
            path <<  'output=json' 
          else
            path << '&output=json'
          end
        else
          path << '?output=json'
        end
        URI.encode(path)
      end
      
      def paramify(params)
        params.map { |k,v| "#{k}=#{v}" }.join('&')
      end
  end
end