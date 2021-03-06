require 'rails_helper'

RSpec.describe "Individual Hockey Teams Pages", type: :feature do

  it "Has all team attributes" do
    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )

    visit "/hockeyteams/#{team_1.id}"

    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_1.city)
    expect(page).to have_content(team_1.rank)
    expect(page).to have_content(team_1.original_franchise)
    expect(page).to have_content(team_1.stanley_cups)
    expect(page).to have_content(team_1.created_at)
    expect(page).to have_content(team_1.updated_at)
  end

  it "Has an edit link" do
    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )

    visit "/hockeyteams/#{team_1.id}"

    expect(page).to have_link('Edit Team', href: "/hockeyteams/#{team_1.id}/edit")
  end

  it "Has a delete button" do
    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )

    visit "/hockeyteams/#{team_1.id}"

    expect(page).to have_selector("input[type=submit][value=delete]")
  end

  it "Can delete the team" do
    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )
    player = team_1.players.create(
      name: "Trevor Suter",
      age: 24,
      attended_college: true,
      years_played: 2
    )

    visit "/hockeyteams/#{team_1.id}"
    find("input[type=submit][value=delete]").click

    expect(href: '/hockeyteams')
    expect(page).to_not have_content(team_1.name)
    expect(href: '/players').to_not have_content(player.name)
  end

  it 'Has a link for the players and hockey teams index page' do
    team_1 = HockeyTeam.create(
      name: "Colorado Avalanche",
      city: "Denver",
      rank: 1,
      original_franchise: false,
      stanley_cups: 2
    )
    player = team_1.players.create(
      name: "Trevor Suter",
      age: 24,
      attended_college: true,
      years_played: 2
    )

    visit "/hockeyteams/#{team_1.id}"
    expect(page).to have_link("Players Who Played College", href: '/players')
    expect(page).to have_link('Hockey Teams', href: '/hockeyteams')
  end
end