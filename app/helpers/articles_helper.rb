module ArticlesHelper
  def markdown(text)
    sanitize_markdown(MarkdownTopicConverter.format(text))
  end
end
