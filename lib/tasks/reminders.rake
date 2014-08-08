namespace :reminders do
  desc "This task will send an SMS reminder for an event"
  task text: :environment do

    account_sid = 'AC6c7802a7e68e1af540c71218c3435e34'
    auth_token = '9bf1e98b019c361e98095ff89a9b706a'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    Event.all.each do |event|

      now = Time.now.strftime("%l:%M %p")
      departure = event.departure_time.strftime("%l:%M %p")
      phonenumber = event.phone_number

      puts "It is #{now} and the departure time is #{departure}."

      if now == departure
         @client.account.messages.create(
         :from => '+16144524246',
         :to => '#{phonenumber}',
         :body => "Hey there, you need to leave now"
         )
       end
    end

  end
end
