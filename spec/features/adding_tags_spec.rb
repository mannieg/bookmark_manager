feature 'Adding Tags to Links' do
  scenario 'allows user to add a tag to a link' do
    visit '/links/new'
    fill_in 'title', :with => 'Makers Academy'
    fill_in 'url', :with => 'http://www.makersacademy.com'
    fill_in 'tags', :with => 'coding'
    click_button 'Add Link'

    expect(current_path).to eq '/links'
    link = Link.first
    expect(link.tags.map(&:name)).to include 'coding'
  end
end
