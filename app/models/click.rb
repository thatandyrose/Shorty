class Click < ActiveRecord::Base
  serialize :request
  belongs_to :short_url
end
