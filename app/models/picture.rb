class Picture < ActiveRecord::Base
  belongs_to :gym
    
  has_attached_file :image, 
                    # :styles => {
                    #   :thumb => "300x300#",
                    #   :medium => "640x1160>"
                    # },
                    :default_url => "/images/:style/missing.png"
                    # :path => "/events/:event_id/pictures/:id"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  
end
