require 'rest_client'
require 'builder'
require 'nokogiri'

class RestApi

  def find_airlines(from=nil, to=nil)
    xml_builder = Builder::XmlMarkup.new
    xml_builder.instruct!
    xml_request = xml_builder.root {
      xml_builder.from(from)
      xml_builder.to(to)
    }
    
    airline_operators = Array.new
    begin
      response = RestClient.post APP_CONFIG['rest_endpoint'], xml_request , {:content_type => :xml}
      
      xml_doc = Nokogiri::XML.parse response.body
      xml_doc.xpath('//airlines').collect {|element| 
        airline_operators.push element.text        
      } 
    rescue => e
      response = e.response
      
      case response.code
      when 404
        xml_doc = Nokogiri::XML.parse response.body
        xml_doc.xpath('//error').collect {|element| 
          airline_operators.push element.text        
        }
      when 400
        xml_doc = Nokogiri::XML.parse response.body
        xml_doc.xpath('//error').collect {|element| 
          airline_operators.push element.text 
        }
      else
        airline_operators.push 'Oops! Something went wrong!'
      end
    end
    
    return airline_operators
  end
  
end