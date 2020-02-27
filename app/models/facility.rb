class Facility < ApplicationRecord
    has_many :field
    belongs_to :user
    searchkick

    validate_enum_attributes :facility_type

    enum facility_type: ['ad','ben']
end
