class User < ApplicationRecord
  rolify
  include Clearance::User
  acts_as_voter
  has_one :admin, dependent: :destroy
  # ...
end
