class Bookmark < ApplicationRecord
  belongs_to :company
  belongs_to :product
end
