RSpec::Matchers.define :have_status do |type, message = nil|
  match do |response|
    if Symbol === type
      if [:success, :missing, :redirect, :error].include?(type)
        response.send("#{type}?")
      else
        code = Rack::Utils::SYMBOL_TO_STATUS_CODE[type]
        response.response_code == code
      end
    else
      response.response_code == type
    end
  end

  failure_message do |response|
    message or
        "Expected response to be a <#{type}>, but was <#{response.response_code}>"
  end
end