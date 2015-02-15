class Authorizer
  class AuthorizerError < Exception; end
  attr_writer :config

  def admin?(user, password)
    if user == config[:user].to_s && password == config[:pass].to_s
      true
    else
      false
    end
  end

  def config
    @config ||= Settings['auth']
  end
end