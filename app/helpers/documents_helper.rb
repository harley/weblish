module DocumentsHelper
  def render_document_preview(document, options = {})
    options[:w] ||= 128
    options[:h] ||= 128

    case document.file.file.extension
    when "png", "jpg", "gif"
      image_tag(document.file, width: options[:w], height: options[:h])
    when "pdf"
      image_tag("http://placehold.it/83x110px/b981a5/305eb8&text=PDF")
      # content_tag(:object, data: document.file.url, type: 'application/pdf', width: options[:w], height: options[:h]) do
      #   "This browser doesn't support displaying PDF"
      # end
    else
      image_tag("//app.divshot.com/img/placeholder-128x128.gif", class: 'media-object', width: options[:w], height: options[:h])
    end
  end

  def render_document(document, options = {})
    case document.file.file.extension
    when "png", "jpg", "gif"
      image_tag(document.file)
    when "pdf"
      if options[:preview]
        content_tag(:object, data: document.file.url, type: 'application/pdf', width: '100%') do
          "This browser doesn't support displaying PDF"
        end
      else
        content_tag(:object, data: document.file.url, type: 'application/pdf', width: '100%', height: '100%', style:'min-height:826px') do
          "This browser doesn't support displaying PDF"
        end
      end
    else
      "Preview Not Available"
    end
  end

  def render_document_topics(document)
    content_tag_for(:span, document.topics, class: 'label label-info') do |topic|
      topic.name
    end
  end

  def render_gviewer(document)
    raw %{<iframe src="http://docs.google.com/viewer?url=#{CGI.escape document.file.url}&embedded=true" width="100%" height="750" style="border: none;"></iframe>}
  end
end
