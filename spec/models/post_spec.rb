require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is invalid without a title" do
    post = Post.new(title: nil)
    post.valid?
    expect(post.errors[:title]).to include("を入力してください")
  end

  it "is invalid without a start_date" do
    post = Post.new(start_date: nil)
    post.valid?
    expect(post.errors[:start_date]).to include("を入力してください")
  end

  it "is invalid without an end_date" do
    post = Post.new(end_date: nil)
    post.valid?
    expect(post.errors[:end_date]).to include("を入力してください")
  end

  it "is invalid an end_date earlier than today" do
    post = Post.new(title: "test", start_date: Date.today, end_date: Date.yesterday)
    post.valid?
    expect(post.errors[:end_date]).to include("を今日以降にしてください")
  end
end