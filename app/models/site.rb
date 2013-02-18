class Site < ActiveRecord::Base
  attr_accessible :name, :url, :status
  include Amazon
end
