class Product < ApplicationRecord
	
	validates :name, presence: true, length: { maximum: 150 }
	validates :price, presence: true
	validates :description, presence: true, length: {maximum: 200}

	has_one_attached :picture

	validates :picture,
	file_content_type: { allow: ['image/jpeg', 'image/png'] },
	if: -> { picture.attachment.present? }

	after_validation :if_picture_not_valid_remove_it
	def if_picture_not_valid_remove_it
		self.picture.purge if self.errors.present? && self.errors.details.key?(:picture)
	end
end
