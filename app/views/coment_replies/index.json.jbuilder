json.array!(@coment_replies) do |coment_reply|
  json.extract! coment_reply, :id, :content, :coment_id
  json.url coment_reply_url(coment_reply, format: :json)
end
