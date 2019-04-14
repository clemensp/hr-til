require 'rails_helper'

describe PostDecorator do
  context '#title' do
    it 'returns (draft) in title if the post is not published' do
      post = FactoryBot.build(:post, :draft, title: 'test')
      decorator = described_class.new(post)
      expect(decorator.title).to eq('test (draft)')
    end

    it 'returns the post title without (draft) when post is published' do
      post = FactoryBot.build(:post, title: 'test')
      decorator = described_class.new(post)
      expect(decorator.title).to eq('test')
    end
  end
end
