class Link < ActiveRecord::Base
validates :slug, uniqueness: true
validates :given_url, presence: true
after_create :generate_slug

# Create a slug for our given_url. 
# Handle the case when it is not possible to generate a new unique ID of length N, by increasing the length to N+1
def generate_slug
	# Count the optimal slug length to start
	links_count = Link.count 
	length = 1
	combinations = (1..49).inject(:*)/(1..49-length).inject(:*)
	while combinations < links_count
		length +=1
		combinations = (1..49).inject(:*)/(1..49-length).inject(:*)
	end

	# Pick a random_id for slug 
	# If slug is not unique: try 5 times to find another combination, after that - try a bigger length
	self.slug = random_id(length)
	until self.valid?
		5.times do 
			self.slug = random_id(length)
			break if self.valid?
		end
		length += 1 
	end

	self.slug = "D"
	save!
end

private
	# Generate a random sequense from letters & numbers excluding ambiguous chars
	def random_id(length=1)
		chars = ('A'..'Z').to_a + ('a'..'z').to_a + ('1'..'9').to_a - %w[I i l L O o 0 U u V v B 8]
		result = ''
		length.times { result << chars.sample }
		result 
	end

end
