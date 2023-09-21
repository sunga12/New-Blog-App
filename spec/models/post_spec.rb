require 'rails_helper'

RSpec.describe Post, type: :model do
  # tests go here


  subject do
    Post.new(
      author: User.create(name: 'Lilly Tester'), title: 'Hello', text: 'This is my first post'
    )
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be less than 250 characters' do
    subject.title = 'a' * 260
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be an integer' do
    subject.comments_counter = 'sandwich'
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be an integer' do
    subject.likes_counter = 'sandwich'
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be greater than or equal to zero' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'LikesCounter should be greater than or equal to zero' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
    subject.likes_counter = 0
    expect(subject).to be_valid
  end
end
