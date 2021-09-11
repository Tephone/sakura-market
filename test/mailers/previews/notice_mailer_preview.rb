# Preview all emails at http://localhost:3000/rails/mailers/notice_mailer
class NoticeMailerPreview < ActionMailer::Preview
  def like_notice_to_user
    like = Like.last
    NoticeMailer.like_notice_to_user(like)
  end

  def comment_notice_to_user
    comment = Comment.last
    NoticeMailer.comment_notice_to_user(comment)
  end
end
