require 'test_helper'
require 'test/unit'
require './lib/rest_api.rb'

class RestApiTest < Test::Unit::TestCase
  test "should find airlines between Mumbai and Singapore" do
    rest_api = RestApi.new
    
    expected_airlines = ['Cathay Pacific', 'Singapore Airlines', 'Malaysian Airlines', 'China Airlines']
    airlines = rest_api.find_airlines('Mumbai', 'Singapore')    
    
    assert_equal(airlines.length, 4)
    assert((expected_airlines & airlines) == expected_airlines)
  end
  
  test "should find no airlines between Mumbai and Beijing" do
    rest_api = RestApi.new
    
    airlines = rest_api.find_airlines('Mumbai', 'Beijing')    
    
    assert_equal(airlines.length, 1)
    assert(airlines[0] == 'No airline operating between desired locations')
  end
  
  test "should throw missing input parameters for empty from request parameter" do
    rest_api = RestApi.new
    
    airlines = rest_api.find_airlines('', 'Beijing')    
    
    assert_equal(airlines.length, 1)
    assert(airlines[0] == 'Some input parameters were missing!')
  end
  
  test "should throw missing input parameters for empty to request parameter" do
    rest_api = RestApi.new
    
    airlines = rest_api.find_airlines('Mumbai', '')    
    
    assert_equal(airlines.length, 1)
    assert(airlines[0] == 'Some input parameters were missing!')
  end
  
  test "should throw missing input parameters for empty from and to request parameters" do
    rest_api = RestApi.new
    
    airlines = rest_api.find_airlines('', '')    
    
    assert_equal(airlines.length, 1)
    assert(airlines[0] == 'Some input parameters were missing!')
  end
end
