require 'spec_helper'

feature "user sees index page of dogs" do
  scenario "user views all submitted dogs" do
    CSV.open('dogs.csv', "a", headers: true) do |csv|
      breed = "pug"
      image = "thisisapug.png"
      csv << [breed, image]
    end

    visit '/dogs'
    expect(page).to have_content("pug")
    expect(page).to have_css("img[src*='thisisapug.png']")
  end

  scenario "user can see dogs from the root path" do
    CSV.open('dogs.csv', "a", headers: true) do |csv|
      breed = "pug"
      image = "thisisapug.png"
      csv << [breed, image]
    end

    visit '/'
    expect(page).to have_content("pug")
  end

  scenario "a user can see the Good Dogs header when they go to the home page" do
    visit '/'

    expect(page).to have_content("Good Dogs")
    expect(page).to have_selector('h1')
  end
end
