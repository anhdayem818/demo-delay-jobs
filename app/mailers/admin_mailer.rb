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
    begin
    api_key= "key-ab289d793aa0262070ab01d82836e89f"
    domain='hahalolo.com'
    mg_client = Mailgun::Client.new api_key
    message_params = {
      :from => "anhdayem818@gmail.com",
      :to => "abc1zbq@gmail.com",
      :subject => "Hello",
      :text => "Testing some Mailgun awesomness!"
    }
    res = mg_client.send_message "#{domain}", message_params
    puts res.body
    rescue Exception => e
      puts e
    end
  end

end
 # RestClient.post "https://api:key-ab289d793aa0262070ab01d82836e89f@api.mailgun.net/v3/sandbox1c7d7425dcc14ce29cdd04f6b626b54c.mailgun.org/messages",
 #  :from => "Excited User test@gmail.com",
 #  :to => "abc1zbq@gmail.com",
 #  :subject => "Hello",
 #  :text => "Testing some Mailgun awesomness!"

  # curl -s --user 'key-ab289d793aa0262070ab01d82836e89f' \
  #   https://api.mailgun.net/v3/hahalolo.com/messages \
  #   -F from='Excited User <mailgun@YOUR_DOMAIN_NAME>' \
  #   -F to=abc1zbq@gmail.com \
  #   -F subject='Hello' \
  #   -F text='Testing some Mailgun awesomness!'