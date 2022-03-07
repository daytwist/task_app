class Post < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :content, length: { maximum: 100 }
  validate :end_date_after_today

  def end_date_after_today
    return if end_date.nil?
    errors.add(:end_date, 'を今日以降にしてください') if end_date < Date.today
  end
end
