class Authorizer
  class AuthorizerError < Exception; end
  attr_writer :config

  def admin?(user, password)
    if user == config[:user].to_s && password == config[:password].to_s
      true
    else
      false
    end
  end

  def config
    @config ||= (YAML.load_file './config/app.yml').symbolize_keys
  end
end