#   And I see a warning that says "DO NOT ENTER REAL BILLING OR SHIPPING INFORMATION"
Then (/^I see a warning that says "([^"]*)"$/) do |warningMessage|
    expect(page).to have_content(warningMessage)
  end
#   And I see a table with the technologies used by this site
Then('I see a table with the technologies used by this site') do
    technologies_table = find(:xpath, "/html/body/div/center/table")
    technologies_rows = technologies_table.all(:xpath, "tbody/tr")
    expect(technologies_rows.size).to be > 1
    technologies_rows.drop(1).each do |row|
      technology_name = row.find(:xpath, "td[1]/blockquote/ul/li[1]/font").text
      expect(technology_name).not_to be_empty, "Found an empty technology name in the table."
    end
  end
  