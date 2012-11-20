module ApplicationHelper
  def full_title(page_title)
    base_title = "Supply Management"
    page_title ? "#{page_title} - #{base_title}" : base_title
end
