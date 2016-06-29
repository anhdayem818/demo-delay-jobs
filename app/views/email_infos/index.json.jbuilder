json.array!(@email_infos) do |email_info|
  json.extract! email_info, :id, :email_id, :is_open, :is_click
  json.url email_info_url(email_info, format: :json)
end
