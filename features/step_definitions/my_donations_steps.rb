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