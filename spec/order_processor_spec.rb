# frozen_string_literal: true

RSpec.describe OrderProcessor do
  it 'has a version number' do
    expect(OrderProcessor::VERSION).not_to be nil
  end
end
