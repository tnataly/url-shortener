require 'rails_helper'

RSpec.describe Link, type: :model do
  before(:each) do 
  	@link = Link.create(given_url: "http://climb.te.ua")
  end

  after(:each) do
  	unless @link.destroyed?
  		@link.destroy
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

  describe 'unit tests' do
    it 'generates slug and stores it' do
      expect(@link.slug).not_to be_nil
    end

    it 'some other unit tests???'

  end


end
