class SearchResultsController < ApplicationController

  def index
    @menu_item_results = MenuItem.search(params[:q])
    @search_locations = Location.search(params[:q])
  end

end
