require './lib/rest_api.rb'

class FindAirlinesController < ApplicationController
  
  respond_to :json
  
  def index
  end
  
  def search
    from = params[:from]
    to = params[:to]  
    
    rest_api = RestApi.new
    airline_operators = rest_api.find_airlines(from, to)    
    
    render :json => {:airlines => airline_operators}
  end
  
end
