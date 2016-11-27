json.extract! mail_list, :id, :address, :created_at, :updated_at
json.url mail_list_url(mail_list, format: :json)