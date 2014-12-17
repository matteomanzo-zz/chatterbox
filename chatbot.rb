require 'colorize'
require_relative 'RESPONSES'

def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/i =~ input }.sample
  /#{key}/i =~ input
  response = RESPONSES[key]
  response.nil? ? add_phrase : response.green % { c1: $1, c2: $2, c3: $3}
end

def add_phrase
  puts 'I don\'t know what you\'re talking about, do you want me to learn? please say \'yes\''.green
  prompt_human
  answer = gets.chomp
  if answer == 'yes'
    prompt_bot
    puts 'Great! What do you want me to add?'.green
    prompt_human
    key = gets.chomp
    prompt_bot
    puts 'And how do you want me to reply?'.green
    prompt_human
    value = gets.chomp
    prompt_bot
    puts 'Thanks! Next time I\'ll be able to answer'.green
    RESPONSES[key] = value
  else
    prompt_bot
    puts 'Keep it for yourself then!!'.green
    chat
  end
end


def prompt_human
  print 'Human: '
end

def prompt_bot
  print 'Bot: '.green
end

def welcome
  prompt_bot
  puts "Hello, what's your name?".green
  prompt_human
  name = gets.chomp
  prompt_bot
  puts "Hello #{name}".green
end

def chat
  prompt_human
    while(input = gets.chomp) do
      if input == 'quit'
        exit
      end
      prompt_bot
      puts get_response(input)
      prompt_human
    end
end

welcome
chat

file = File.new("RESPONSES.rb", "w")
File.open "RESPONSES.rb", "w" do |file|
  @file = file
  @file.puts "RESPONSES = #{RESPONSES}"
end