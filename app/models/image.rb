class Image < ActiveRecord::Base
  belongs_to :picture, polymorphic: true
  has_attached_file :img,
                    :storage => :s3,
                    :bucket => ENV["s3_bucket"],
                    :s3_credentials =>{ :access_key_id => ENV["s3_access_key_id"], :secret_access_key => ENV["s3_secret_access_key"]},
                    :styles => { :medium => "300x300>", :small => "120x120>", :thumb => "50x50>" }
   do_not_validate_attachment_file_type :img
end
