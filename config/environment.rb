# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Global Functions

def code_to_country(code)
  I18n.t(code, :scope => :countries) 
end



# Initialize the Rails application.
Rails.application.initialize!


