
require 'mandrill'
require 'faraday'
require 'sendgrid-ruby'
require 'json/ext'
require 'securerandom'




api_user = ''
endpoint = "/api/mail.send.json"
api_key= "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"
url = "https://api.sendgrid.com/v3"
protocol = "https"
host= 'api.sendgrid.com'
port = nil
endpoint = "/api/mail.send.json"
user_agent = "sendgrid/3;ruby"

sg = SendGrid::API.new(api_key: api_key)


# mail = SendGrid::Mail.new do |m|
#   m.to = 'abc1zbq@gmail.com'
#   m.from = 'tranguyenbach@gmail.com'
#   m.subject = 'Hello world!'
#   m.text = 'I heard you like pineapple.'
#   m.html = 'I heard you like the beach <div><img src="cid:beach"></div> <h1>123</h1> <a href="google.com"> test open </a>'
# end

# conn = Faraday.new(url: url) do |c|
#     c.request :multipart
#     c.request :url_encoded
#     c.adapter Faraday.default_adapter
# end

data = {
  personalizations: [
    {
      to:[
        email: "abc1zbq@gmail.com"
      ]
    }
  ],
  from: { email: "123tranguyenbach1992@gmail.com"},
  subject: "test content",
  content: [
    {
      type: "text/html",
      value: "Hello world <a href='google.com'> google </a> Hello world <a href='sendgrid.com'> tracking </a> "
    }
  ],
  # tracking_settings: {
  #   click_tracking: {
  #     enable: true,
  #     enable_text: true
  #   },
  #   open_tracking:{
  #     enable: true,
  #     substitution_tag: " %opentrack"
  #   },
  #   subscription_tracking:{
  #     enable: true,
  #     html: "If you would like to unsubscribe and stop receiving these emails <% clickhere %>.",
  #     substitution_tag: "<%click here%>",
  #     text: "If you would like to unsubscribe and stop receiveing these emails <% click here %>."
  #   }
  # },
  custom_args:{
    _id: "sendgrid_#{SecureRandom.urlsafe_base64}"
  },
}
# data = JSON.parse('
#   {
#     "personalizations": [
#       {"to": [
#         {"email": "abc1zbq@gmail.com"}
#         ]
#       }
#     ],
#     "from": {
#       "email": "tranguyenbach1992@gmail.com"
#     },
#     "subject": "Hello, World 123!",
#     "content": [
#       {"type": "text/html", "value": "Heya! <a href > 123 </a> "}
#     ],
#     "tracking_settings": {
#       "click_tracking": {
#         "enable": true,
#         "enable_text": true
#       }
#     },
#     "custom_args": {
#       "_id": "sendgrid_1234567890"
#     },
#     "subscription_tracking": {
#       "enable": true,
#       "html": "If you would like to unsubscribe and stop receiving these emails <% clickhere %>.",
#       "substitution_tag": "<%click here%>",
#       "text": "If you would like to unsubscribe and stop receiveing these emails <% click here %>."
#     }
#   }'
# )

response = sg.client.mail._("send").post(request_body: data)
puts response.status_code
puts response.body
puts response.headers


# data = JSON.parse('{
#   "enabled": true
# }')
# response = sg.client.tracking_settings.click.patch(request_body: data)
# puts response.status_code
# puts response.body
# puts response.headers

# response = sg.client.tracking_settings.click.get()
# puts response.status_code
# puts response.body
# puts response.headers

# res = conn.post do |req|
#     req.url(endpoint)

#     req.body = data
#   end

# puts res.body

# {"_json"=>[
#     {"ip"=>"50.31.49.42", "response"=>"250 2.0.0 OK 1465870255 g126si1557578ita.43 - gsmtp ", "sg_event_id"=>"aTYiO0XIQziKkLMQLxxjHQ", "sg_message_id"=>"g1O94lpgRK-v0W7qmFo70g.filter0807p1mdw1.22854.575F67AC2F.0", "tls"=>1, "event"=>"delivered", "email"=>"abc1zbq@gmail.com", "timestamp"=>1465870255, "smtp-id"=>"<g1O94lpgRK-v0W7qmFo70g@ismtpd0025p1mdw1.sendgrid.net>"},
#     {"email"=>"abc1zbq@gmail.com", "timestamp"=>1465870253, "smtp-id"=>"<g1O94lpgRK-v0W7qmFo70g@ismtpd0025p1mdw1.sendgrid.net>", "sg_event_id"=>"7nNGFulbThOm88Jf076aFw", "sg_message_id"=>"g1O94lpgRK-v0W7qmFo70g.filter0807p1mdw1.22854.575F67AC2F.0", "event"=>"processed"}
#     ]
# }
# {"_json"=>[
#     {"ip"=>"50.31.49.42", "response"=>"250 2.0.0 OK 1465870255 g126si1557578ita.43 - gsmtp ", "sg_event_id"=>"aTYiO0XIQziKkLMQLxxjHQ", "sg_message_id"=>"g1O94lpgRK-v0W7qmFo70g.filter0807p1mdw1.22854.575F67AC2F.0", "tls"=>1, "event"=>"delivered", "email"=>"abc1zbq@gmail.com", "timestamp"=>1465870255, "smtp-id"=>"<g1O94lpgRK-v0W7qmFo70g@ismtpd0025p1mdw1.sendgrid.net>"},
#     {"email"=>"abc1zbq@gmail.com", "timestamp"=>1465870253, "smtp-id"=>"<g1O94lpgRK-v0W7qmFo70g@ismtpd0025p1mdw1.sendgrid.net>", "sg_event_id"=>"7nNGFulbThOm88Jf076aFw", "sg_message_id"=>"g1O94lpgRK-v0W7qmFo70g.filter0807p1mdw1.22854.575F67AC2F.0", "event"=>"processed"}
#     ]
# }

# {"domain"=>"sandbox4be0352aa9624fe3ba3f3f5f10ce2701.mailgun.org", "my_var_1"=>"Mailgun Variable #1", "my-var-2"=>"awesome",
#  "message-headers"=>"[[\"Received\", \"by luna.mailgun.net with SMTP mgrt 8734663311733; Fri, 03 May 2013 18:26:27 +0000\"], [\"Content-Type\", [\"multipart/alternative\", {\"boundary\": \"eb663d73ae0a4d6c9153cc0aec8b7520\"}]], [\"Mime-Version\", \"1.0\"], [\"Subject\", \"Test deliver webhook\"], [\"From\", \"Bob <bob@sandbox4be0352aa9624fe3ba3f3f5f10ce2701.mailgun.org>\"], [\"To\", \"Alice <alice@example.com>\"], [\"Message-Id\", \"<20130503182626.18666.16540@sandbox4be0352aa9624fe3ba3f3f5f10ce2701.mailgun.org>\"], [\"X-Mailgun-Variables\", \"{\\\"my_var_1\\\": \\\"Mailgun Variable #1\\\", \\\"my-var-2\\\": \\\"awesome\\\"}\"], [\"Date\", \"Fri, 03 May 2013 18:26:27 +0000\"], [\"Sender\", \"bob@sandbox4be0352aa9624fe3ba3f3f5f10ce2701.mailgun.org\"]]", "Message-Id"=>"<20130503182626.18666.16540@sandbox4be0352aa9624fe3ba3f3f5f10ce2701.mailgun.org>", "recipient"=>"alice@example.com", "event"=>"delivered", "timestamp"=>"1465892164", "token"=>"e0a0a58d424769f55050b57fe44c169b95892dc118bc3acd56", "signature"=>"1793cd1633069068e37cffd95a454da67348a0f7f8c65cc72acb6df89285d9de", "body-plain"=>"", "controller"=>"hook", "action"=>"survery_created_callback"}

# curl -X POST -H "Content-Type: application/json" -d '[{"email":"abc1zbq@gmail.com","timestamp":1337197600,"smtp-id":"<4FB4041F.6080505@sendgrid.com>","event":"processed"},{"email":"john.doe@sendgrid.com","timestamp":1465874414,"category":"newuser","event":"click","url":"https://sendgrid.com"},{"email":"john.doe@sendgrid.com","timestamp":1465874414,"smtp-id":"<20120525181309.C1A9B40405B3@Example-Mac.local>","event":"processed"}]'

# curl -s --user 'api:key-75ba52e6546cd74e5da5754a6e21f6d3' https://api.mailgun.net/v3/sandbox4be0352aa9624fe3ba3f3f5f10ce2701.mailgun.org -F from='Excited User <mailgun@sandbox4be0352aa9624fe3ba3f3f5f10ce2701.mailgun.org >'-F to=YOU@sandbox4be0352aa9624fe3ba3f3f5f10ce2701.mailgun.org -F to=abc1zbq@gmail.com -F subject='Hello'-F text='Testing some Mailgun awesomness!'

# curl -s --user 'api:YOUR_API_KEY' \
#     https://api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages \
#     -F from='Excited User <mailgun@YOUR_DOMAIN_NAME>' \
#     -F to=YOU@YOUR_DOMAIN_NAME \
#     -F to=bar@example.com \
#     -F subject='Hello' \
#     -F text='Testing some Mailgun awesomness!'

# curl --request POST \
#   --url https://api.sendgrid.com/v3/mail/send/beta \
#   --header 'Authorization: Bearer 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' \
#   --header 'Content-Type: application/json' \
#   --data '{"personalizations": [{"to": [{"email": "abc1zbq@gmail.com"}]}],"from": {"email": "dx@sendgrid.com"},"subject": "Hello, World!","content": [{"type": "text/plain", "value": "Heya!"}]}'
