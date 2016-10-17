require 'digest/md5'

RSpec.describe Message do
  it 'can be initialised with attributes' do
    message = Message.new(text: 'My secret message', link: Digest::MD5.hexdigest('link'))
    expect(message.text).to eq('My secret message')
    expect(message.link).to eq(Digest::MD5.hexdigest('link'))
  end
  it 'generates unique links' do
  	message_older = Message.new(text: 'My unique message', link: Digest::MD5.hexdigest(Time.new.to_f.to_s))
  	message_newer = Message.new(text: 'My unique message', link: Digest::MD5.hexdigest(Time.new.to_f.to_s))
  	expect(message_older.link).not_to eq(message_newer.link)
  end
end
