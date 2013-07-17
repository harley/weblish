module ApplicationHelper
  def javascripts(&block)
    content_for :javascripts, &block
  end
end
