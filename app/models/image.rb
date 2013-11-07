class Image < ActiveRecord::Base

	scope :newest_first, -> { order("created_at DESC") }
  scope :most_recent_six, -> { newest_first.limit(6) }

  def self.created_before(time)
  	where("created_at < ?", time)
  end
end
