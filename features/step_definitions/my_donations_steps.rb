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