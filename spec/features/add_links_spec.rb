feature "adding new links to list" do
    scenario "User adds new link to list" do
      visit'/'
      click_button "Add link"
      fill_in "Title", :with => "google"
      fill_in "Link", :with => "www.google.com"
      click_button "Submit"
      expect(page).to have_content("www.google.com has been added")
    end
    scenario "User taggs link" do
      visit'/'
      click_button "Add link"
      fill_in "Link", :with => "www.google.com"
      fill_in "Tag", :with => "Search Engine"
      click_button "Submit"
      expect(page).to have_content("Search Engine www.google.com has been added")
    end
end
