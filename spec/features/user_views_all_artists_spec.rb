require 'rails_helper'

RSpec.feature "User views all artists" do
    scenario "they see the names of each artist" do
        artists = %w(Isis Riwen Caspian).map do |artist_name|
            Artist.create(name: artist_name, image_path: "https://media.pitchfork.com/photos/59319e7ee6ae866c276974dd/2:1/w_790/2eff6f91.jpg")
        end

        visit artists_path

        artists.each do |artist|
            expect(page).to have_link artist.name, href: artist_path(artist)
        end
    end
end