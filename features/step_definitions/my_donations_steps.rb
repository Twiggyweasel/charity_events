Given("I have made donations") do
  FactoryBot.create(:donation,
                    :user => @registered_user,
                    :amount => 45.00,
                    :method => 1)

  FactoryBot.create(:donation,
                    :user => @registered_user,
                    :amount => 100.00,
                    :method => 1)
end

Then("I should see a list of my donations") do
  expect(page).to have_content("$45.00")
  expect(page).to have_content("$100.00")
end

When("I create a new donations") do
  click_link "New Donation"

  fill_in "donation_method", :with => 1
  fill_in "donation_amount", :with => 515.00

  click_button "Create Donation"
end

Then("I should see my new donation in my donations") do
  visit root_path

  expect(page).to have_content("$515.00")
end

Given("I have a donation in my donations") do
  FactoryBot.create(:donation, :user => @registered_user, :method => 1, :amount => 12.00)
end

When("I change the amount of my donation") do
  visit root_path

  click_link "Edit"

  fill_in "donation_amount", :with => 76.00

  click_button "Update Donation"
end

Then("I should see the donation with the new amount in my donations") do
  visit root_path

  expect(page).to_not have_content("$12.00")
  expect(page).to have_content("$76.00")
end

When("I remove a donation from my donations") do
  visit root_path

  click_link "Delete"
end

Then("I should not see it listing in my donations anymore") do
  expect(page).to_not have_content("$12.00")
end