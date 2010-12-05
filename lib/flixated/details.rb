module Flixated
  class Client
    # Returns details about a specific movie title.
    # Valid parameters are:
    #   :id Unique identifier for the desired movie title.
    #
    # OAuth consumer key and signature required
    def movie_details(id)
      get(URI.escape("/catalog/titles/movies/#{id.to_s}"))
    end
    
    # Returns details about a specific television series.
    # Valid parameters are:
    #   :id Unique identifier for the desired television series.
    #
    # OAuth consumer key and signature required
    def series_details(id)
      get(URI.escape("/catalog/titles/series/#{id.to_s}"))
    end
    
    # Returns details about season collections for a
    # specific television series.
    # Valid parameters are:
    #   :series_id Unique identifier for the desired television series.
    #   :season_id Unique identifier for the desired season of the specified
    #              television series.
    #
    # OAuth consumer key and signature required
    def season_details(series_id, season_id)
      get(URI.escape("/catalog/titles/series/#{series_id.to_s}/seasons/#{season_id.to_s}"))
    end
    
    # Returns details about a specific television program.
    # Valid parameters are:
    #   :id Unique identifier for the desired television program.
    #
    # OAuth consumer key and signature required
    def program_details(id)
      get(URI.escape("/catalog/titles/programs/#{id.to_s}"))
    end
    
    # Returns details about a specified DVD disc.
    # Valid parameters are:
    #   :id Unique identifier for the desired DVD disc.
    #
    # OAuth consumer key and signature required
    def disc_details(id)
      get(URI.escape("/catalog/titles/discs/#{id.to_s}"))
    end
    
    # Titles determined to be similar to the title
    # referenced by the URL identifier.
    # Valid parameters are:
    #   :id          Unique identifier for the desired title.
    #   :start_index The zero-based offset into the results of the query. When
    #                used with the max_results parameter, you can request
    #                successive pages of search results.
    #   :max_results The maximum number of results to return. This number
    #                cannot be greater than 500. If max_results is not
    #                specified, the default value is 25.
    #
    # OAuth consumer key and signature required
    def similars(id, params = {})
      args = params.map { |k,v| "#{k}=#{v}" }.join('&')
      get(URI.escape("/catalog/titles/#{id.to_s}/similars?#{args}"))
    end
  end
end