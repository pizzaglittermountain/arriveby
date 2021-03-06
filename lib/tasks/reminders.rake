namespace :reminders do
  desc "This task will send an SMS reminder for an event"
  task text: :environment do

    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    Event.all.each do |event|

      now = Time.now.strftime("%l:%M %p")
      departure = event.departure_time.strftime("%l:%M %p")

      puts "It is #{now} and the departure time is #{departure}."

      if now == departure
         @client.account.messages.create(
         :from => '+16144524246',
         :to => event.phone_number,
         :body => "Hey there, you need to leave now"
         )
      end
    end

  end
end
