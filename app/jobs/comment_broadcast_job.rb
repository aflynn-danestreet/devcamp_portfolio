class CommentBroadcastJob < ApplicationJob
# create queue, comments are going to go into an ordered list 
  queue_as :default
# takes a comment, I want you to start a broadcast where the channel is the blog id
# different channels for different blogs, like watching tv channel
# in this process, we simply want to render the comment
  def perform(comment)
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
  end

  private

  def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end