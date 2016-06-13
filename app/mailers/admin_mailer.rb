class AdminMailer < ActionMailer::Base

  default from: "no-replay@example.com"
  default to: "anhdayem818@gmail.com"

  def new_letter
    mail(subject: "Hello wrold")
  end

  def mandrill_client
    @mandrill_client ||= Mandrill::API.new 'sFNOsSJcFHA4xync0lMuqQ'
  end

  def demo
    template_name = 'demo'
    template_content = []
    message = {
      to: [
        {email: "abc1zbq@gmail.com", :name => "tran nguyen bach"}
      ],
      subject: "Hello wrold",
      from_email: "trannguyenbach1992@gmail.com",
      merge_vars: [
        {
          rept: "trannguyenbach1992@gmail.com",
          vars: [
            {name: "name", content: "WORLD"}
          ]
        }
      ]
    }
    mandrill_client.messages.send message
  end

  def sendgrid_client
    client = SendGrid::Client.new do |c|
      c.api_key = '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'
    end
    mail = SendGrid::Mail.new do |m|
      m.to = 'abc1zbq@gmail.com'
      m.from = 'taco@cat.limo'
      m.subject = 'Hello world!'
      m.text = 'I heard you like pineapple.'
      m.html = 'I heard you like the beach <div><img src="cid:beach"></div> <h1>123</h1>'

    end

    res = client.send(mail)
    puts res.code
    puts res.body
  end

end
