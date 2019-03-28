class Tagging < ApplicationRecord
  validates :short_url_id, :topic_id, uniqueness: true, presence: true
end
