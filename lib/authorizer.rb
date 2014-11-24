class Authorizer
  class AuthorizerError < Exception; end
  attr_writer :config

  def admin?(user, password)
    if user == config[:user] && password == config[:password]
      true
    else
      false
    end
  end

  def config
    @config ||= YAML.load_file './config/app.yml'
  end
end