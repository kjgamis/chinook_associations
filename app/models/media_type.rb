class MediaType < ApplicationRecord
  has_many :tracks

  has_many :genres, through: :tracks
end
