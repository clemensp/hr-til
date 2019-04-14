require 'rails_helper'

RSpec.describe PostSlack::CreateSerializer, type: :serializer do
  context 'Individual Resource Representation' do
    it 'is serialized correctly' do
      developer = FactoryBot.build(:developer, username: 'tpope')
      post = FactoryBot.build(:post,
                        slug: 'sluggishslug',
                        body: 'learned some things',
                        developer: developer,
                        title: 'entitled title',
                        channel: FactoryBot.create(:channel, name: 'hacking')
                       )

      serializer = PostSlack::CreateSerializer.new(post)
      serialized = JSON.parse(serializer.to_json)['text']

      expected_text = 'tpope created a new post - <http://www.example.com/'\
      'posts/sluggishslug-entitled-title|entitled title> #hacking'

      expect(serialized).to eql(expected_text)
    end

    it 'is serialized and includes Slack display name' do
      developer = FactoryBot.build(:developer, username: 'tpope', slack_name: 'Tim Pope')
      post = FactoryBot.build(:post,
                        slug: 'sluggishslug',
                        body: 'learned some things',
                        developer: developer,
                        title: 'entitled title',
                        channel: FactoryBot.create(:channel, name: 'hacking')
                       )

      serializer = PostSlack::CreateSerializer.new(post)
      serialized = JSON.parse(serializer.to_json)['text']

      expected_text = 'Tim Pope created a new post - <http://www.example.com/'\
      'posts/sluggishslug-entitled-title|entitled title> #hacking'

      expect(serialized).to eql(expected_text)
    end
  end
end
