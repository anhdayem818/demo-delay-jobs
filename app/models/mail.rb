require 'sendgrid-ruby'
# SENDGRID_API_KEY = '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'

sg = SendGrid::API.new(api_key: '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')


# import com.fasterxml.jackson.databind.JsonNode;
# import com.fasterxml.jackson.databind.ObjectMapper;

# import com.sendgrid.Client;
# import com.sendgrid.Method;
# import com.sendgrid.Request;
# import com.sendgrid.Response;
# import com.sendgrid.SendGrid;

# import java.io.IOException;
# import java.util.HashMap;
# import java.util.Map;

##################################################
# Create a batch ID #
# POST /mail/batch #

response = sg.client.mail.batch.post()
puts response.status_code
puts response.body
puts response.headers

# ##################################################
# # Validate batch ID #
# # GET /mail/batch/{batch_id} #

# batch_id = "test_url_param"
# response = sg.client.mail.batch._(batch_id).get()
# puts response.status_code
# puts response.body
# puts response.headers

# ##################################################
# # v3 Mail Send #
# # POST /mail/send #
# # This endpoint has a helper, check it out [here](https://github.com/sendgrid/sendgrid-ruby/blob/master/lib/helpers/mail/README.md).

# data = JSON.parse('{
#   "asm": {
#     "group_id": 1,
#     "groups_to_display": [
#       1,
#       2,
#       3
#     ]
#   },
#   "attachments": [
#     {
#       "content": "[BASE64 encoded content block here]",
#       "content_id": "ii_139db99fdb5c3704",
#       "disposition": "inline",
#       "filename": "file1.jpg",
#       "name": "file1",
#       "type": "jpg"
#     }
#   ],
#   "batch_id": "[YOUR BATCH ID GOES HERE]",
#   "categories": [
#     "category1",
#     "category2"
#   ],
#   "content": [
#     {
#       "type": "text/html",
#       "value": "<html><p>Hello, world!</p><img src=[CID GOES HERE]></img></html>"
#     }
#   ],
#   "custom_args": {
#     "New Argument 1": "New Value 1",
#     "activationAttempt": "1",
#     "customerAccountNumber": "[CUSTOMER ACCOUNT NUMBER GOES HERE]"
#   },
#   "from": {
#     "email": "sam.smith@example.com",
#     "name": "Sam Smith"
#   },
#   "headers": {},
#   "mail_settings": {
#     "bcc": {
#       "email": "ben.doe@example.com",
#       "enable": true
#     },
#     "bypass_list_management": {
#       "enable": true
#     },
#     "footer": {
#       "enable": true,
#       "html": "<p>Thanks</br>The SendGrid Team</p>",
#       "text": "Thanks,/n The SendGrid Team"
#     },
#     "sandbox_mode": {
#       "enable": false
#     },
#     "spam_check": {
#       "enable": true,
#       "post_to_url": "http://example.com/compliance",
#       "threshold": 3
#     }
#   },
#   "personalizations": [
#     {
#       "bcc": [
#         {
#           "email": "sam.doe@example.com",
#           "name": "Sam Doe"
#         }
#       ],
#       "cc": [
#         {
#           "email": "jane.doe@example.com",
#           "name": "Jane Doe"
#         }
#       ],
#       "custom_args": {
#         "New Argument 1": "New Value 1",
#         "activationAttempt": "1",
#         "customerAccountNumber": "[CUSTOMER ACCOUNT NUMBER GOES HERE]"
#       },
#       "headers": {
#         "X-Accept-Language": "en",
#         "X-Mailer": "MyApp"
#       },
#       "send_at": 1409348513,
#       "subject": "Hello, World!",
#       "substitutions": {
#         "sub": {
#           "%name%": [
#             "John",
#             "Jane",
#             "Sam"
#           ]
#         }
#       },
#       "to": [
#         {
#           "email": "abc1zbq@gmail.com",
#           "name": "John Doe"
#         }
#       ]
#     }
#   ],
#   "reply_to": {
#     "email": "sam.smith@example.com",
#     "name": "Sam Smith"
#   },
#   "sections": {
#     "section": {
#       ":sectionName1": "section 1 text",
#       ":sectionName2": "section 2 text"
#     }
#   },
#   "subject": "Hello, World!",
#   "tracking_settings": {
#     "click_tracking": {
#       "enable": true,
#       "enable_text": true
#     },
#     "open_tracking": {
#       "enable": true,
#       "substitution_tag": "%opentrack"
#     },
#     "subscription_tracking": {
#       "enable": true,
#       "html": "If you would like to unsubscribe and stop receiving these emails <% clickhere %>.",
#       "substitution_tag": "<%click here%>",
#       "text": "If you would like to unsubscribe and stop receiveing these emails <% click here %>."
#     }
#   }
# }')
# response = sg.client.mail._("send").post(request_body: data)
# puts response.status_code
# puts response.body
# puts response.headers