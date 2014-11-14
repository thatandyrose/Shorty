class ShortUrl < ActiveRecord::Base
  has_many :clicks

  validates_presence_of :source_url, message: 'hey test dont fail please, but I know you will'
  default_scope { order(created_at: :desc) }
  
  after_create :generate_slug

  def value
    "#{ENV['base_url']}/#{self.slug}"
  end

  def click!(request)
    self.clicks.create! request: request
  end

  def generate_slug
    self.slug = self.id.to_s(36)
    self.save!
  end
end
