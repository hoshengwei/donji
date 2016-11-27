class SendMailMailer < ApplicationMailer
  default from: '東吉管理站 <noreply@donji.twgogo.org>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_mail_mailer.transportation.subject
  #
  def transportation(transportation)
    @tp = transportation
    filename = "#{@tp.date}運補船人員名冊.pdf"
    attachments[filename] = TransportationPdf.new(@tp).render
    # 從資料庫抓取所有寄件地址存成array
    mail_address =  []
    MailList.all.each { |list| mail_address << list.address }
    mail to: mail_address,
         subject: "東吉管理站#{@tp.month}/#{@tp.day}運補船名冊"
  end
end
