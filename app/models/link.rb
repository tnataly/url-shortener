class Link < ActiveRecord::Base
validates :slug, uniqueness: true
validates :given_url, presence: true
after_create :generate_slug

# Create a slug for our given_url. 
# Handle the case when it is not possible to generate a new unique ID of length N, by increasing the length to N+1
def generate_slug
	length = 1
	self.slug = random_id(length)
	while !self.valid?
		self.slug = random_id(length)
		length += 1 
	end
	self.save
end

private
	# Generate a random sequense from letters & numbers excluding ambiguous chars
	def random_id(length=1)
		#chars = 'abcdefghjkmnpqrstwxyzACDEFGHJKMNPQRSTWXYZ2345679'
		chars = ('A'..'Z').to_a + ('a'..'z').to_a + ('1'..'9').to_a - ['I', 'i', 'l', 'L', 'O', 'o', "0", 'U', 'u', 'V', 'v', 'B', "8"]
		result = ''
		length.times { result << chars.sample }
		result 
	end

end
