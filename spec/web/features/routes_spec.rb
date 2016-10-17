require 'features_helper'

RSpec.describe Web::Routes do
  it 'generates "/"' do
    actual = described_class.path(:root)
    expect(actual).to eq '/'
  end

end