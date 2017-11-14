# feature tests for Bookmark Manager Index Page
require 'capybara/rspec'

 # Capybara.app = Bookmark

describe 'Bookmark', :type => :feature do

  feature '#index' do
    scenario 'see list of web site links ' do
      visit "/"
      expect(page).to have_content('Links')
    end
  end
end
