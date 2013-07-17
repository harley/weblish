"Anthropology, Economics, History, Languages & Literature, Management, Marketing, Natural Sciences, Political Science, Philosophy, Psychology, Sociology, Other".split(',').each do |name|
  Topic.seed(:name) do |s|
    s.name = name.strip
  end
end
