class TagTopic < ApplicationRecord
  validates :topic_name, uniqueness: true, presence: true
end
