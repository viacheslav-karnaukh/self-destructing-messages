RSpec.describe MessageRepository do
  before do
  	MessageRepository.clear
  	MessageRepository.create(Message.new(text: 'Message for test', link: 'test_link'))
  end
  
  it 'can find message by link' do
  	message = MessageRepository.find_by_link('test_link')
  	expect(message.text).to eq('Message for test')
  end
end
