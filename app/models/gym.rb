class Gym < ApplicationRecord
    has_many :clients
    has_many :memberships, dependent: :destroy
end

# If the Gym exists, it should be removed from the database, along with any Memberships that are associated with it (a Membership belongs to a Gym, so you need to delete the Memberships before the Gym can be deleted).
# After deleting the Gym, return an empty response body, along with the appropriate HTTP status code.