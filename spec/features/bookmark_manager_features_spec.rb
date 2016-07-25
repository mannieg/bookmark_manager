
feature '#viewing_links' do
  scenario 'user views link on homepage' do
    Link.create(title: 'google', url: 'www.google.com' )
    visit '/'
    within('ul.links') do
      expect(page).to have_content 'google'
    end
  end
end
