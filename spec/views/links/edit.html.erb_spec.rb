require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :given_url => "MyString",
      :slug => "MyString",
      :clicks => 1,
      :snapshot => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "input#link_given_url[name=?]", "link[given_url]"

      assert_select "input#link_slug[name=?]", "link[slug]"

      assert_select "input#link_clicks[name=?]", "link[clicks]"

      assert_select "input#link_snapshot[name=?]", "link[snapshot]"

      assert_select "input#link_title[name=?]", "link[title]"
    end
  end
end
