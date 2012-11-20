require "minitest_helper"

describe ApplicationHelper do
  it "must only show base_title when page_title is nil" do
    full_title().must_equal "Supply Management"
  end

  it "must show full_title when page_title is defined" do
    full_title("This page").must_equal "This page - Supply Management"
  end
end