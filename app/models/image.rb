class Image < ApplicationRecord
  belongs_to :project
  has_many :scores, dependent: :destroy
end
