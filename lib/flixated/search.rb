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
    def title_search(term, params = {})
      args = '&' + params.map { |k,v| "#{k}=#{v}" }.join('&') unless params.empty?
      get(URI.escape("/catalog/titles?term=#{term}#{args}"))
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
      get(URI.escape("/catalog/titles/autocomplete?term=#{term}"))
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
    def title_index(include_amg = false, include_tms = false)
      get(URI.escape("/catalog/titles/index?include_amg=#{include_amg}&include_tms=#{include_tms}"))
    end
  end
end