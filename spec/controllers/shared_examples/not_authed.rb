
shared_examples 'user not authed' do
  before {session[:admin] = false}
  it 'return 401 error' do
    stub_request
    expect(response).to have_status 401
  end
end