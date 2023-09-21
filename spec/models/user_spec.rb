require 'rails_helper'

RSpec.describe User, type: :model do
  #tests go here
  subject { User.new(
    name: 'Lilly Tester',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'Teacher from Poland.')
  }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be greater than or equal to zero' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be an integer' do
    subject.posts_counter = 'sandwich'
    expect(subject).to_not be_valid
  end

end