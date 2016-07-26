feature 'filters tags' do
  scenario 'user filters links by tag bubbles' do
    visit '/links/new'
    fill_in 'title', :with => 'Makers Academy'
    fill_in 'url', :with => 'http://www.makersacademy.com'

    fill_in 'tags', :with => 'coding'
    click_button 'Add Link'
    visit '/links/new'
    fill_in 'title', :with => 'bubble Academy'
    fill_in 'url', :with => 'http://www.bubblesacademy.com'
    fill_in 'tags', :with => 'bubbles'
    click_button 'Add Link'
    visit 'tags/bubbles'
    expect(page).to have_content "bubble Academy"
    expect(page).not_to have_content "Makers Academy"
  end 

end
