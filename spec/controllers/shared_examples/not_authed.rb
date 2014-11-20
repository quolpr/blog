
shared_examples 'user not authed' do
  it 'return 401 error' do
    make_request
    expect(response).to have_status 401
  end
end