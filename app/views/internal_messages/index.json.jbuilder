json.array!(@internal_messages) do |internal_message|
  json.extract! internal_message, :id
  json.url internal_message_url(internal_message, format: :json)
end
