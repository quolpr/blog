
shared_examples 'not valid data' do
  before{mock_model}
  before{make_request}
  it { should respond_with(400) }
end