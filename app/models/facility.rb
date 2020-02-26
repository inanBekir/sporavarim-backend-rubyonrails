class Facility < ApplicationRecord
    has_many :field
    searchkick
end
