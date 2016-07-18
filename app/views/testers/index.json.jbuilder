json.array!(@testers) do |tester|
  json.extract! tester, :id, :name, :email
  json.url tester_url(tester, format: :json)
end
