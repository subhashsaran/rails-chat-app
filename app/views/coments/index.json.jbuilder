json.array!(@coments) do |coment|
  json.extract! coment, :id, :content, :article_id
  json.url coment_url(coment, format: :json)
end
