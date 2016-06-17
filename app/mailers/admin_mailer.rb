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
      m.html = 'I heard you like the beach <div><img src="cid:beach"></div> <h1>123</h1> <a href="google.com"> test open </a>'
    end
    res = client.send(mail)
    puts res.code
    puts res.body
  end

  def mailgun_client
    api_key= "key-75ba52e6546cd74e5da5754a6e21f6d3"
    domain='sandbox4be0352aa9624fe3ba3f3f5f10ce2701.mailgun.org'
    mg_client = Mailgun::Client.new api_key
    message_params = {
      :from => "anhdayem818@gmail.com",
      :to => "abc1zbq@gmail.com",
      :subject => "Hello",
      :text => "Testing some Mailgun awesomness!"
    }
    mg_client.send_message "#{domain}", message_params
    puts res
  end

end
