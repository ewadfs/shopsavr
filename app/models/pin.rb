class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :image_remote_url
Paperclip.options[:command_path] = 'C:/Program Files (x86)/ImageMagick-6.8.7-Q16'   
  validates :description, presence: true
  validates :user_id, presence: true

    
   validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
                            belongs_to :user
                             has_attached_file :image, styles: { medium: "320x240>"}
  
 belongs_to :user
 belongs_to :boards

 include Tire::Model::Search
include Tire::Model::Callbacks

def self.search(params)
  tire.search(load: true) do
    query { string params[:query], default_operator: "AND" } if params[:query].present?
    filter :range, published_at: {lte: Time.zone.now}
  end
end
def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end

end
