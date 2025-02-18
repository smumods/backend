class Book < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :course

  # Serializers
  serialize :authors, Array
  serialize :photos, Array

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :isbn10, presence: true
  validates :isbn10, format: { with: /\A\d{9}[\d|X]$\z/, message: "Must be a valid ISBN10 format!" }
  validates :isbn13, presence: true
  validates :isbn13, format: { with: /\A(97(8|9))+(-)?\d{9}(\d|X)$\z/, message: "Must be a valid ISBN13 format!" }

  # Callbacks
  after_create :reload_uuid # make sure its reloaded before sending telegram notifications
  # after_create :notify_smumods_telegram_of_listing
  after_update :notify_smumods_telegram_of_event

  private
  def notify_smumods_telegram_of_listing
    user = self.user.reload
    listing_url = BooksHelper.get_book_url(self)
    telegram_username = "@#{user.telegram_username.nil? ? "NIL_TELEGRAM_USERNAME" : user.telegram_username}"
    message = %Q(🌍 #{Rails.env.upcase}\n📨 #{telegram_username} added a book.\n🔗 #{listing_url}\n👨 #{Book.count} books listed so far\n💰 #{Book.where(is_sold: true).count} sold so far)
    message.strip!
    Services::PushMore.new(message).deliver
  end
  
  def notify_smumods_telegram_of_event
    if self.is_sold
      message = "🎉 @#{self.user.telegram_username} just sold a book! 👏👏"
      Services::PushMore.new(message).deliver
    end
  end

  def reload_uuid
    if self.attributes.has_key? 'uuid'
      self[:uuid] = self.class.where(id: id).pluck(:uuid).first
    end
  end
end