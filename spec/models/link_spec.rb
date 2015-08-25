require 'rails_helper'

RSpec.describe Link, type: :model do
  before(:all) do 
  	@link = Link.create(given_url: "http://climb.te.ua")
  end

  after(:all) do
  	unless @link.destroyed?
  		@link.destroyed
  	end
  end

  describe 'validations' do
	it { should validate_presence_of(:given_url) }
	it { should validate_uniqueness_of(:slug) }
  end

  describe 'database columns' do
  end

  describe 'associations' do
  end
end
