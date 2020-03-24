require 'rails_helper'

RSpec.feature "User submits a new artist" do
    scenario "they enter data to create a new artist" do
        artist_name       = "Cult of Luna"
        artist_image_path = "https://www.metalblade.com/us/newspics/cult-of-luna-photo.jpg"
        
        visit '/artists'
        click_on 'New Artist'
        fill_in "artist_name", with: artist_name
        fill_in "artist_image_path", with: artist_image_path
        click_on "Create Artist"
        
        expect(page).to have_content artist_name
        expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    end
    
    context "the submitted data is invalid" do 
        scenario "they see an error message" do
            artist_image_path = "https://www.metalblade.com/us/newspics/cult-of-luna-photo.jpg"

            visit artists_path
            click_on "New Artist"
            fill_in "artist_image_path", with: artist_image_path
            click_on "Create Artist"

            expect(page).to have_content "Name can't be blank"
        end
    end
end