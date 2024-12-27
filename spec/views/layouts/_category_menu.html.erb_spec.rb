require 'rails_helper'

RSpec.describe 'layouts/_category_menu.html.erb', type: :view do
  before do
    @categories = [
      FactoryBot.create(:category, :electronics),
      FactoryBot.create(:category, :fashion),
      FactoryBot.create(:category, :home_garden)
    ]
    render
  end

  it "displays the category list" do
    expect(rendered).to include(@categories.first.name)
    expect(rendered).to include(@categories.second.name)
    expect(rendered).to include(@categories.third.name.gsub('&', '&amp;'))
  end

  it "displays the 'All Categories' link" do
    expect(rendered).to include("All Categories")
  end

  it "links to each category" do
    @categories.each do |category|
      assert_select "a[href=?]", category_path(category), text: category.name
    end
  end
end
