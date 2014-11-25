json.array!(@email_magazines) do |email_magazine|
  json.extract! email_magazine, :id, :title
  json.url email_magazine_url(email_magazine, format: :json)
end
