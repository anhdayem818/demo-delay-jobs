
require 'mandrill'

begin
    mandrill = Mandrill::API.new 'sFNOsSJcFHA4xync0lMuqQ'
    message = {"global_merge_vars"=>[{"content"=>"merge1 content", "name"=>"merge1"}],
     "to"=>
        [{"name"=>"Tran Nguyen Bach ",
            "type"=>"to",
            "email"=>"chris@gorails.com"}],
     "text"=>"Example text content",
     "track_opens"=>true,
     "track_clicks"=> true,
     "bcc_address"=>"trannguyenbach1992@gmail.com",
     "headers"=>{"Reply-To"=>"anhadyem818@example.com"},
     "merge_language"=>"mailchimp",
     "from_name"=>"Example Name",
     "subject"=>"example subject",
     "html"=>"<p>Example HTML content</p>",
     "merge"=>true,
     "from_email"=>"trannguyenbach1992@gmail.com",
     "attachments"=>
        [{"content"=>"ZXhhbXBsZSBmaWxl",
            "name"=>"myfile.txt",
            "type"=>"text/plain"}],
     "important"=>true}
    send_at = Time.now
    result = mandrill.messages.send message, send_at
    puts result

rescue Mandrill::Error => e
    # Mandrill errors are thrown as exceptions
    puts "A mandrill error occurred: #{e.class} - #{e.message}"
    # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'
    raise
end