class PictureMailer < ApplicationMailer
 def picture_mail(contact)
 @picture = picture
 mail to: "gakuo1983@yahoo.co.jp", subject: "お問い合わせの確認メール"
 end
end
