module DocumentsHelper
  def render_document(document)
    case document.file.file.extension
    when "png", "jpg", "gif"
      image_tag(document.file)
    when "pdf"
      content_tag(:object, data: document.file.url, type: 'application/pdf', width: '100%', height: '100%', style:'min-height:826px') do
        "This browser doesn't support displaying PDF"
      end
    else
      "Preview Not Available"
    end
  end
end
