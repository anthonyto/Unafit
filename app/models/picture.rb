class Picture < ActiveRecord::Base
  belongs_to :gym
    
  has_attached_file :image, 
                    :styles => {
                      :large => "850x500#", 
                      :medium => "520x500#", 
                      :small => "200x150#"
                    },
                    :convert_options => {
                       :thumb => "-strip" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  
end
