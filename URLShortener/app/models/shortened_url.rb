class ShortenedUrl < ApplicationRecord
  validates :user_id, :long_url, presence: true

  def self.random_code
    code = SecureRandom.urlsafe_base64
    if !self.exists?(:short_url => code)
      code
    else
      ShortenedUrl.random_code
    end
  end

  def self.create_shortened_url(user, long_url)
    ShortenedUrl.create!(:long_url => long_url, :short_url => ShortenedUrl.random_code, :user_id => user.id)
  end

  belongs_to :submitter,
             primary_key: :id,
             foreign_key: :user_id,
             class_name: :User

  has_many :visits,
           primary_key: :id,
           foreign_key: :short_url_id,
           class_name: :Visit

  has_many :visitors,
           Proc.new { distinct },
           through: :visits,
           source: :user

  def num_clicks
    self.visits.count(:id)
  end

  def num_uniques
    self.visitors.count(:user_id)
  end

  def num_recent_uniques
    self.visitors.where("visits.created_at > ?", 10.minutes.ago).count(:user_id)
  end
end
