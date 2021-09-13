class NoticeMailer < ApplicationMailer
  def like_notice_to_user(like)
    @like = like
    mail to: 'from@example.com', subject: 'あなたの日記にgoodがつきました'
    # localでのみ送信するため、宛先は適当なものにしました
  end

  def comment_notice_to_user(comment)
    @comment = comment
    mail to: 'from@example.com', subject: 'あなたの日記にコメントがつきました'
    # localでのみ送信するため、宛先は適当なものにしました
  end
end
