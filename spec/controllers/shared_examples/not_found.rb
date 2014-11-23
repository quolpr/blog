
shared_examples 'not found' do
  before{mock_model}
  before{make_request}
  it { should respond_with(404) }
end