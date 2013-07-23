papers_path = Rails.root.join("papers")
metadata_files = Dir.glob(File.join(papers_path, "*.txt"))
metadata_files.each do |file|
  metadata = File.read(file)
  p metadata
  hash = {}
  metadata.each_line do |line|
    first, second = line.split(':', 2)
    if second
      hash[first.underscore] = second.strip
    end
  end
  if topic_string = hash.delete("topics")
    topics = topic_string.split(',').map {|t| Topic.where(name: t.strip).first_or_create}
  else
    topics = []
  end
  name = hash.delete('name')
  doc = Document.where(name: name).first_or_initialize(hash)
  if doc.new_record?
    doc.topics = topics
    doc.file = File.open(Rails.root.join('papers', hash['file']))
    doc.save!
  end
end

