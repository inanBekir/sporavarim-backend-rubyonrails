class Field < ApplicationRecord
  belongs_to :facility
  searchkick
end
