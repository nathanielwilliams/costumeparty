class Wrestler < ActiveRecord::Base
  has_one :user
  default_scope -> { order(id: :asc) }
  mount_uploader :image, PictureUploader
  validates :name, presence: true
  validates :image, presence: true
  validate  :picture_size

  private
    # Validates the size of an uploaded picture.
    def picture_size
      if image.size > 1.megabytes
        errors.add(:image, "should be less than 1MB (the Hulkster ain't made of storage!)")
      end
    end
end
