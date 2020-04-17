class BlogsChannel < ApplicationCable::Channel
  def subscribed
    byebug
    # this looks for channel via params, connects to it
    stream_from "blogs_#{params['blog_id']}_channel"
  end
  
  def unsubscribed
  end
  
  def send_comment(data)
    byebug
    byebug 
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
  end
end