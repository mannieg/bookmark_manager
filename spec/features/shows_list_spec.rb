feature "shows list of links from database" do
  scenario "User sees list of links" do
    visit '/'
    expect(page).to have_content("Link")
  end
  scenario "User filters links by tag" do
    visit '/'
    fill_in "Tag name", :with => "Search Engine"
    click_button "Filter"
    expect(page).to have_content ("Showing tags: Search Engine")

end
