
shared_examples 'user not authed' do
  before {session[:admin] = false}
  before {make_request}
  it { should respond_with(401) }
end