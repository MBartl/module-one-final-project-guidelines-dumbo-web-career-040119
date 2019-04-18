class SocialCliA
  def self.social_art_a
    art = puts <<-'EOF'
    ___________________
    | _______________ |
    | |XXXXXXXXXXXXX| |
    | |XXX FIND XXXX| |
    | |XXX SOME XXXX| |
    | |XX FRIENDS XX| |
    | |XXXXXXXXXXXXX| |
    |_________________|
        _[_______]_
    ___[___________]___
   |         [_____] []|__
   |         [_____] []|  \__
   L___________________J     \ \___\/
    ___________________      /\
   /###################\    (__)
    EOF
    art
    CliStart.alex_say("This page features a picture a computer composed out of different characters such as brackets. The computer screen shows the sign: make some friends.")
  end

  def self.output_a(meetup_api, results, counter)
    results = meetup_api['results']
    num = rand(1...20)
    if results[num]['name'] != nil
      meetup_name = results[num]['name']
    end
    if results[num]['description'] != nil
      meetup_description = results[num]['description'].tr('/', '').slice!(3, 300)
    end
    if results[num]['event_url']
      meetup_url = results[num]['event_url']
    end
    if results[num]['name'] != nil && results[num]['description'] != nil && results[num]['event_url'] != nil
      puts "#{counter}. " + '🔹  ' + meetup_name + ' 🔹' + "\n What: " + meetup_description + '(...)' + "\n RSVP: " + meetup_url + "\n\n"
      CliStart.sam_say("Meetup name: #{meetup_name}. Meetup desscription: #{meetup_description}. RSVP: #{meetup_url}")

    else
      self.output_a(meetup_api, results, counter)
    end
  end

  def self.random_meetup_a(user)
    meetup_api = JSON.parse(RestClient.get('https://api.meetup.com/2/concierge?key=2f673325f5b422527f3d7e1c683f&sign=true&photo-host=public&country=United States&city=New York City&category_id=34'))
    system 'clear'
    self.social_art_a
    results = meetup_api['results']
    CliStart.sam_say("Here's what's happening around you in tech")
    puts "\nHere's what's happening around you in tech:\n\n"
    self.output_a(meetup_api, results, counter)
    self.after_meetups_a(user)
  end

  def self.after_meetups_a(user)
    prompt = TTY::Prompt.new
    nav = prompt.select('What do you want to do next?', %w[More Back])
    CliStart.sam_say("What do you want to do next? Choose top option to see next meetup and bottom one to go back to your homepage")
    if nav == 'More'
      self.random_meetup_a(user)
    else
      user.category_search_page_a
    end
  end

end