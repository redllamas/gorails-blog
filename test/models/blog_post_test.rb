require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  setup do
    @draft_post = BlogPost.new(published_at: nil)
    @published_post = BlogPost.new(published_at: 1.month.ago)
    @scheduled_post = BlogPost.new(published_at: 1.month.from_now)
  end

  test "draft? returns true for draft blog post" do
    assert @draft_post.draft?
  end

  test "draft? returns false for published blog post" do
    refute @published_post.draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute @scheduled_post.draft?
  end

  test "published? returns true for published blog post" do
    assert @published_post.published?
  end

  test "published? returns false for draft blog post" do
    refute @draft_post.published?
  end

  test "published? returns false for scheduled blog post" do
    refute @scheduled_post.published?
  end

  test "scheduled? returns true for scheduled blog post" do
    assert @scheduled_post.scheduled?
  end

  test "scheduled? returns false for draft blog post" do
    refute @draft_post.scheduled?
  end

  test "scheduled? returns false for published blog post" do
    refute @published_post.scheduled?
  end
end
