RSpec::Matchers.define :have_flash do |content|
  match_unless_raises do |page|
    page.within("#flash") do
      expect(page).to have_content(content)
    end
  end
end
