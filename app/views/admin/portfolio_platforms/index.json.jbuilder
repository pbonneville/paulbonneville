json.array!(@portfolio_platforms) do |portfolio_platform|
  json.extract! portfolio_platform, :id, :title, :sortOrder
  json.url admin_portfolio_platform_url(portfolio_platform, format: :json)
end
