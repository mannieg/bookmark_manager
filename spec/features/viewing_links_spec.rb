feature 'showing list of links' do
  scenario 'User can see list of links' do
    Link.create(:title => "Google", :url => "www.google.com")
    visit '/links'
    expect(page.status_code).to eq 200

    within'ul#links' do
      expect(page).to have_content ('Google')
    end
  end
end
