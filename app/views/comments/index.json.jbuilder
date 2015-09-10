json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :article_id
  json.url comment_url(comment, format: :json)
end
