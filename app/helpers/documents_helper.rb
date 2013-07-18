module DocumentsHelper
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
end
