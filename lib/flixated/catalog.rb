module Flixated
  class Client
    # Returns the  matching titles in relevance order and
    # total number of results.
    # Valid parameters are:
    #   :term        The word or term for which to search in the catalog. The
    #                method searches the title and synopses of catalog titles
    #                fields for a match.
    #   :start_index The zero-based offset into the results of the query. When
    #                used with the max_results parameter, you can request
    #                successive pages of search results.
    #   :max_results The maximum number of results to return. This number
    #                cannot be greater than 100. If max_results is not
    #                specified the default value is 25.
    #
    # OAuth consumer key and signature required
    def titles(term, params = {})
      args = '&' + paramify(params) unless params.empty?
      get("/catalog/titles?term=#{term}#{args}")
    end
    
    # Returns movie and television titles that match a
    # partial search text. The title names can be passed
    # to the title search API to conduct the actual search.
    # Valid parameters are:
    #   :term The partial or complete search term to use to search for title
    #         matches in the catalog.
    #
    # OAuth consumer key required
    def autocomplete(term)
      get("/catalog/titles/autocomplete?term=#{term}")
    end
    
    # Returns an index of all titles in the Netflix
    # catalog. You can use the index data to interlink
    # titles.
    # Valid parameters are:
    #   :include_amg Include AMG identifiers in title index items.
    #   :include_tms Include TMS identifiers in title index items.
    #
    # Preauthorization is required to access AMG (All Movie
    # Guide) or TMS (TMS Entertainments, Ltd.) identifiers.
    #
    # OAuth consumer key and signature required
    def index(include_amg = false, include_tms = false)
      get("/catalog/titles/index?include_amg=#{include_amg}&include_tms=#{include_tms}", {}, false)
    end
    
    # Returns details about a specific movie title.
    # Valid parameters are:
    #   :id Unique identifier for the desired movie title.
    #
    # OAuth consumer key and signature required
    def movie(id)
      get("/catalog/titles/movies/#{id.to_s}")
    end
    
    # Returns details about a specific television series.
    # Valid parameters are:
    #   :id Unique identifier for the desired television series.
    #
    # OAuth consumer key and signature required
    def series(id)
      get("/catalog/titles/series/#{id.to_s}?")
    end
    
    # Returns details about season collections for a
    # specific television series.
    # Valid parameters are:
    #   :series_id Unique identifier for the desired television series.
    #   :season_id Unique identifier for the desired season of the specified
    #              television series.
    #
    # OAuth consumer key and signature required
    def season(series_id, season_id)
      get("/catalog/titles/series/#{series_id.to_s}/seasons/#{season_id.to_s}")
    end
    
    # Returns details about a specific television program.
    # Valid parameters are:
    #   :id Unique identifier for the desired television program.
    #
    # OAuth consumer key and signature required
    def program(id)
      get("/catalog/titles/programs/#{id.to_s}")
    end
    
    # Returns details about a specified DVD disc.
    # Valid parameters are:
    #   :id Unique identifier for the desired DVD disc.
    #
    # OAuth consumer key and signature required
    def disc(id)
      get("/catalog/titles/discs/#{id.to_s}")
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
      args = '?' + paramify(params) unless params.empty?
      get("/catalog/titles/#{id.to_s}/similars#{args}")
    end
    
    # Returns results that include catalog title entries
    # with people that match the specified name. Results
    # include references to person details.
    # Valid parameters are:
    #   :term        The word or term in the person name for which to search in
    #                the catalog. The method searches the person names for
    #                catalog titles for match.
    #   :start_index The zero-based offset into the results of the query. When
    #                used with the max_results parameter, you can request
    #                successive pages of search results.
    #  :max_results  The maximum number of results to return. This number
    #                cannot be greater than 500. If max_results is not
    #                specified, the default value is 25.
    #
    # OAuth consumer key and signature required
    def people(term, params = {})
      args = '&' + paramify(params) unless params.empty?
      get("/catalog/people?term=#{term}#{args}")
    end
    
    # For the specified person, returns a bio and a list of
    # all titles which that person is associated.
    # Valid parameters are:
    #   :id Unique identifier for the desired person.
    #
    # OAuth consumer key and signature required
    def person(id)
      get("/catalog/people/#{id.to_s}")
    end
  end
end