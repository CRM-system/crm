class Product < ApplicationRecord
	validates :name, presence: true, length: { maximum: 150 }
	validates :price, presence: true
	validates :description, presence: true, length: {maximum: 200}

	has_one_attached :picture


	validate :correct_picture_type
	after_validation :if_picture_not_valid_remove_it

	private

	def correct_picture_type
		if picture.attached? && !picture.content_type.in?(%w(image/jpeg image/png))
			errors.add(:picture, 'must be a JPEG or JPG or PNG')
		elsif picture.attached? == false
			errors.add(:picture, 'must have an picture attached')
		end
	end
	


	 def if_picture_not_valid_remove_it
	 	self.picture.purge if self.errors.present? && self.errors.details.key?(:picture)
	 end

end
	