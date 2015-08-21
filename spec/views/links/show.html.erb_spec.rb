require 'rails_helper'

RSpec.describe "links/show", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :given_url => "Given Url",
      :slug => "Slug",
      :clicks => 1,
      :snapshot => "Snapshot",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Given Url/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Snapshot/)
    expect(rendered).to match(/Title/)
  end
end
