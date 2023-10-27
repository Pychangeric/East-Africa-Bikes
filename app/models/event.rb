class Event < ApplicationRecord
    has_one_attached :poster
    mount_uploader :poster, EventImageUploader


end
