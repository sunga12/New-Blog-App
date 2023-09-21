require 'rails_helper'

RSpec.describe Like, type: :model do
  #tests go here

  subject { Like.new(
    post: Post.create(author: User.create(name: 'David Testing'), title: 'Hello', text: 'This is Davids post'), 
    author: User.create(name: 'Lilly Tester'))
  }

  before { subject.save }

  it 'LikesCounter should increase by 1' do
    subject.increment_post_likes_counter
    expect(subject.post.likes_counter).to eq(2)
  end

  it 'LikesCounter should decrease by 1' do
    subject.decrement_post_likes_counter
    expect(subject.post.likes_counter).to eq(0)
  end
end