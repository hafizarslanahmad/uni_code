class University < ApplicationRecord

    has_many :students, dependent: :destroy
    belongs_to :user
end
