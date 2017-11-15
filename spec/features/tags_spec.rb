feature 'Visit a tag name' do
  scenario 'List links with given tag' do
    create_link('Google', 'https://www.google.co.uk', 'search')
    create_link('Yahoo', 'https://www.yahoo.co.uk', 'search')
    create_link('Amazon', 'https://www.amazon.co.uk', 'bubbles')
    create_link('Ebay', 'https://www.ebay.co.uk', 'bubbles')
    visit('/tags/bubbles')
    expect(page).to have_content('Amazon')
    expect(page).to have_content('Ebay')
  end
end
