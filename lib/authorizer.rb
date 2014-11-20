class Authorizer
  class AuthorizerError < Exception; end

  def initialize
    @config = YAML.load_file './config/app.yml'
  end

  def admin?(user, password)
    if user == @config[:user] && password == @config[:password]
      true
    else
      false
    end
  end
end