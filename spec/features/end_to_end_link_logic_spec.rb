require "rails_helper"

feature 'User creates new link' do
	background do 
		visit root_path
		expect(page).to have_content 'Make your links manageable'
		fill_in 'field-url', with: 'http://climb.te.ua'
		click_button 'Shrink URL'
	end

	scenario 'and link has appeared on home page' do
		expect(page).to have_content 'Your links'
	end

	scenario 'user sees all info about url' do
		click_link 'link_slug' 
		expect(page).to have_content 'http://climb.te.ua'
		expect(page).to have_content Link.find_by_given_url("http://climb.te.ua").slug
	end

end

