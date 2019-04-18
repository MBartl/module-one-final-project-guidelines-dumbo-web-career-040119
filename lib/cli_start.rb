class StartCli

def self.sam_say(text)
	system("say -v samantha '#{text}'")
end

def self.sam_say_slow(text)
	system("say -v samantha -r 100 '#{text}'")
end

def self.alex_say(text)
	system("say -v alex '#{text}'")
end

def self.welcome
  puts "Welcome to Thrive. [audio announcement playing, text will proceed]"
  self.sam_say('Welcome to Thrive. An app to help you go through a bootcamp. Would you like audio on or off?')
  sleep (0.03)
  self.sam_say('Please choose the top option for audio on. And bottom option for audio off.')
  self.choosing
end

def self.choosing
  prompt = TTY::Prompt.new
  puts "An app to help you go through a coding bootcamp. Would you like audio on or off?"
  choices = ["Audio on", "Audio off"]
  nav = prompt.select('Please choose 1 for "audio on" and 2 for "audio off".', choices)
  if nav == "Audio on"
    CommandLineInterface_a.landing_page_a
  else
    CommandLineInterface.landing_page
  end
end

# binding.pry

end
