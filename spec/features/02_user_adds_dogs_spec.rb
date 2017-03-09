require 'spec_helper'

feature "user adds a dog" do
  scenario "dog is added when form is filled out" do
    visit '/dogs'

    fill_in "Breed", with: "pug"
    fill_in "Photo", with: "thisisapug.png"
    click_on "submit"

    expect(page).to have_content("pug")
  end

  scenario "an empty element is not added to the page when an empty form is submitted" do

    visit '/dogs'
    click_link_or_button "submit"

    expect(page).to_not have_selector('h3')
  end
end
