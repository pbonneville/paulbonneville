json.array!(@portfolio_entries) do |portfolio_entry|
  json.extract! portfolio_entry, :id, :title, :platform, :role, :overview
  json.url admin_portfolio_entry_url(portfolio_entry, format: :json)
end
