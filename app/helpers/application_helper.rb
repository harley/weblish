module ApplicationHelper
  def javascripts(&block)
    content_for :javascripts, &block
  end

  def title(page_title, show_title = true, different_title_symbol = nil)
    unless @show_title # prevent overriding when called multiple times
      title_symbol = different_title_symbol || :title
      content_for(title_symbol) { page_title.to_s } if page_title.present?
      @show_title = show_title
    end
    nil # output nothing
  end

  def show_title?
    @show_title
  end

  def current_user?(user)
    current_user === user
  end
end
