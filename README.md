Chatterbox Challenge
====================

The topic of the challenge is the iteration between a human and a chatbot.
Starting from this code...

	def get_response(input)
	  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
	  /#{key}/ =~ input
	  response = RESPONSES[key]
	  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
	end

	RESPONSES = { 'goodbye' => 'bye', 
	              'sayonara' => 'sayonara', 
	              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
	              'I love (.*)' => 'I love %{c1} too', 
	              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}'}

	puts "Hello, what's your name?"
	name = gets.chomp
	puts "Hello #{name}"
	while(input = gets.chomp) do
	  puts get_response(input)
	end

... you have to:

- add at least five more responses so that the bot has a bigger range of conversation;
- add at least another two more responses that use regex capture groups - that's the %{c1} being replaced with whatever matched the brackets (.*) in the regular expression. In Ruby regex capture groups are stored in $1, $2 etc after a regex match takes place;
- extend the bot so that there is a key word, e.g. "quit" that will end the session;
- add a prompt in front of each sentence to indicate if either the person or the bot is talking;
- make the bot and the person's chat different colours;
- extend the bot so that it can handle more than two regular expression capture groups;
- extend the bot to that the user can add new kinds of responses through the chat interaction;
- extend the bot so that the set of responses is saved to a file and reloaded when the bot restarts.

Resources
---------

- [Ruby Regex tutorial](http://rubylearning.com/satishtalim/ruby_regular_expressions.html)
- [Ruby Regex cheat sheet](http://www.ralfebert.de/archive/ruby/regex_cheat_sheet/)
- [Eliza Chatbot](http://en.wikipedia.org/wiki/ELIZA)
