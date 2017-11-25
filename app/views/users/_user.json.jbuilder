json.extract! user, :id, :provider, :uid, :name, :image_url, :old, :university, :job1, :job2, :job3, :result_id, :created_at, :updated_at
json.url user_url(user, format: :json)
