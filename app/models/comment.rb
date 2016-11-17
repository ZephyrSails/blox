class Comment < ActiveRecord::Base
  belongs_to :writer
  belongs_to :article
end
