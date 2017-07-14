# == Schema Information
#
# Table name: shortened_urls
#
#  id        :integer          not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#

class ShortenedUrl < ActiveRecord::Base
  validates :long_url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    code = SecureRandom.urlsafe_base64

    return code unless self.exists?(short_url: code)

    nil
  end



  def self.gen_short_url(user, long_url)
    ShortenedUrl.create(long_url: long_url, short_url: random_code, user_id: user.id)
  end

  def num_clicks
    visits.length
  end

  def num_uniques
    visits.select(:user_id).distinct.length
  end

  def num_recent_uniques
    visits.select(:user_id).distinct.where("created_at <= ?", 10.minutes.ago).length
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

end
