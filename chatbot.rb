require 'colorize'

def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?'.blue : response % { c1: $1, c2: $2, c3: $3}
end

def prompt_human
  print 'Human: '
end

def prompt_bot
  print 'Bot: '.green
end



RESPONSES = { 'goodbye' => 'bye',
              'sayonara' => 'sayonara',
              'the weather is (.*)' => 'I hate it when it\'s %{c1}',
              'I love (.*)' => 'I love %{c1} too',
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
              'how are you?' => 'I\'m fine, thanks. And you?',
              'I\'m good' => 'Glad to hear that',
              'I would like to (.*)' => 'Let\'s %{c1} together!',
              '(.*) is a great animal, better than (.*)' => 'do you really think that %{c1} is better than %{c2}??',
              'anyway my surname is (.*)' => 'Oh sorry Mr. %{c1}!',
              'I\'m going to (.*) some (.*) and (.*)' => 'cool, can you %{c1} some for me as well? I need %{c2} and %{c3}',
              'tonight there it will be a nice (.*), shall we think about?' => 'no! I don\'t really like %{c1}.'}


f = File.new("RESPONSES", "w")

File.open 'RESPONSES',  'w' do |file|

prompt_bot
puts "Hello, what's your name?".green
file.puts "Hello, what's your name?".green
prompt_human
name = gets.chomp
file.puts "#{name}"
prompt_bot
puts "Hello #{name}".green
file.puts "Hello #{name}".green
prompt_human
while(input = gets.chomp) do
  file.puts input
  prompt_bot
  puts get_response(input).green
  file.puts get_response(input).green
  prompt_human
  if input == 'quit'
  	break
  end
end
end