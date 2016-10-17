require_relative '../../../../apps/web/controllers/messages/create'

RSpec.describe Web::Controllers::Messages::Create do
  let(:action) { described_class.new }
  let(:params) { Hash[message: {text: 'some text message'}] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
