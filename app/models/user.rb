class User < ApplicationRecord
  rolify
  include Clearance::User
  has_one :admin, dependent: :destroy
  # ...
end
