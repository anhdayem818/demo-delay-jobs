json.array!(@newsletters) do |newsletter|
  json.extract! newsletter, :id, :delivered_at, :subject
  json.url newsletter_url(newsletter, format: :json)
end
