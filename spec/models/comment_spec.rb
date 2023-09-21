require 'rails_helper'

RSpec.describe Comment, type: :model do
  # tests go here

  subject do
    Comment.new(
      post: Post.create(author: User.create(name: 'David Testing'), title: 'Hello', text: 'This is Davids post'),
      author: User.create(name: 'Lilly Tester'),
      text: 'One Amazing test comment'
    )
  end

  before { subject.save }

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should increase by 1' do
    expect(subject.post.comments_counter).to eq(1)
  end

  it 'CommentsCounter should decrease by 1' do
    subject.decrement_post_comments_counter
    expect(subject.post.comments_counter).to eq(0)
  end
end
