namespace :reminders do
  desc "This task will send an SMS reminder for an event"
  task text: :environment do

    # put your own credentials here
  account_sid = 'AC6c7802a7e68e1af540c71218c3435e34'
  auth_token = '9bf1e98b019c361e98095ff89a9b706a'
  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create(
  :from => '+16145813654',
  :to => 'event.phone_number',
  :body => 'Hey there!'
)
  end
end
