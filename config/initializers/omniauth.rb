Rails.application.config.middleware.use OmniAuth::Builder do
  provider :weibo, ENV['WEIBO_KEY'], ENV['WEIBO_SECRET']
  provider :qq_connect, ENV['QQ_CONNECT_APP_KEY'], ENV['QQ_CONNECT_APP_SECRET'], scope: "get_user_info,add_share"
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :douban, ENV['DOUBAN_KEY'], ENV['DOUBAN_SECRET']
end