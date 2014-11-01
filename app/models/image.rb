class Image < ActiveRecord::Base
  belongs_to :picture, polymorphic: true
  has_attached_file :img,
                    :storage => :s3,
                    :bucket => ENV["s3_bucket"],
                    :s3_credentials =>{ :access_key_id => ENV["access_key_id"], :secret_access_key => ENV["secret_access_key"]},
                    :styles => { :medium => "300x300>" }
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
end
