class Cli
attr_accessor :cards,:major, :minor, :current_card, :wands, :cups, :pentacles, :swords, :current_suit, :current_suit_deck, :minor_range, :major_range
  def run
    system("clear")
    Card.destroy_all
    Api.new("https://rws-cards-api.herokuapp.com/api/v1/cards").create_cards
    greet
  end
  def blink
    sleep(0.25)
  end


  def greet
    @greeting = Greeting.new
    @count = 0
    system("clear")
    puts "Welcome to the World of Tarot".red
    puts "Welcome to the World of Tarot".blue
    puts "Welcome to the World of Tarot".yellow
    puts "Welcome to the World of Tarot".green
    puts ""
    @greeting.art
    puts ""
    puts ""
    @greeting.text
    puts "Please wait while I get a deck ready for you..."
  blink
get_user_input
end

def get_user_input
puts "Type anything and press enter To Continue"
user_input = gets.strip
main_menu if user_input
end

def main_menu
  system("clear")
  puts "The Major Arcana Tarot cards represent the life lessons, karmic
  influences and the big archetypal themes that are influencing your life
  and your soul's journey to enlightenment. The Major Arcana card meanings are
  deep and complex –in beautiful ways! Theses Tarot cards truly represent the
  structure of human consciousness and hold the keys to life lessons passed d
  own through the ages."
  puts ""
  puts ""
  puts "The 56 Minor Arcana cards reflect the trials and tribulations that
  we experience on a daily basis. Even though the Minor Arcana
  cards are called ‘minor', it doesn't mean that these Tarot
  cards won't have a significant impact in your life. These Tarot
  cards relate to what's happening in your daily life, and can offer
  insight into how your present situation is affecting you and what
  steps you need to take to manifest your goals."
  puts ""
  puts ""
  puts ""
  puts ""
  puts "Which deck would you like to explore? Type 'major' or 'minor'"
  puts ""
  get_deck_type
end

def get_deck_type
  @deck_type = gets.strip
if @deck_type == "major"
  print_major_arcana
elsif @deck_type == "minor"
  minor_menu
elsif @deck_type == "exit"
  exit
else
  puts "Invalid input. Put either major or minor."
  sleep(1.2)
  system("clear")
main_menu
end
end

def minor_menu
system("clear")
puts "The Suit of Wands represents your energy, motivation and passion. The Wands cards often appear in Tarot readings about life purpose, spirituality and new ideas."
puts ""
puts ""
puts "The Suit of Cups represents your feelings, emotions, intuition and creativity. The Cups cards often appear in Tarot readings about relationships and your emotional connection with yourself and others."
puts ""
puts ""
puts "The Suit of Swords represents your thoughts, words and actions. The Swords cards often appear in Tarot readings about communicating your ideas, making decisions, and asserting your power."
puts ""
puts ""
puts "The Suit of Pentacles represents your finances, work and material possessions. The Pentacles cards often appear in Tarot readings about career and financial wealth."
puts ""
puts ""
puts "Which suit would you like to explore?"
get_suit
end

def get_suit
  user_input = gets.strip
  if user_input == "wands"
  @current_suit_deck = Card.wands
  @current_suit = "wands"
  elsif user_input == "cups"
  @current_suit_deck = Card.cups
  @current_suit = "cups"
  elsif user_input == "pentacles"
  @current_suit_deck = Card.pentacles
  @current_suit = "pentacles"
  elsif user_input == "swords"
  @current_suit_deck = Card.swords
  @current_suit = "swords"
  else
  puts "Invalid input, please pick a valid suit"
  puts "Ex 'wands'"
  system("clear")
  minor_menu
end
  list_suit(@current_suit_deck, @current_suit)
end

def list_suit(array_of, suit)
system("clear")
array = []
array << "#{suit}"
array << ""
array_of.each {|card| array << "#{card.value_int} #{card.name}"}
array.each {|element| puts "#{element}"}
puts ""
puts ""
puts "Please choose one of the cards by typing its number."
puts "Ex: '1' would give you 'Ace of #{suit}'"
puts ""
puts ""
get_card_minor(suit)
end

def get_card_minor(suit)
user_input = gets.strip
@suit = suit
@minor_range = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
if @minor_range.include?(user_input.to_i)
if @suit == "wands"
@current_card = Card.wands.find do |card|
card.value_int == user_input.to_i
end
system("clear")
@current_card.info
prompt_for_input_minor(@suit)
elsif @suit == "cups"
@current_card = Card.cups.find do |card|
card.value_int == user_input.to_i
end
system("clear")
@current_card.info
prompt_for_input_minor(@suit)
elsif @suit == "pentacles"
@current_card = Card.pentacles.find do |card|
card.value_int == user_input.to_i
end
system("clear")
@current_card.info
prompt_for_input_minor(@suit)
elsif @suit == "swords"
@current_card = Card.swords.find do |card|
card.value_int == user_input.to_i
end
end
else
puts "Invalid input, please pick a valid card"
puts "Please choose a suit and card again"
sleep(1)
minor_menu
end
end


def print_major_arcana
system("clear")
Card.major.each {|card| puts "#{card.value_int}. #{card.name}"}
puts ""
puts ""
puts "Please choose one of the cards by typing its number."
puts "Ex: '1' would give you 'The Magician'"
puts ""
puts ""
get_card
end


def get_card
  user_input = gets.strip
  major_range = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"]
  if major_range.include?(user_input)
  @current_card = Card.major.find do |card|
  card.value_int == user_input.to_i
  end
  system("clear")
  @current_card.info
  if @current_card.type == "major"
  prompt_for_input_major
end
else
  puts "Invalid input. Please choose a valid card."
  sleep(1)
  print_major_arcana
end
end


def prompt_for_input_minor(suit)
puts "Would you like to continue?"
puts "Enter 'cards' to go back to the list of the cards in this suit."
puts "Enter 'suits' to go back to the list of minor the suits cards."
puts "Enter 'next' to see the next card in the minor arcana"
puts "Enter 'back' to see the previous card in the minor arcana"
puts "Enter 'exit' to exit the program"
puts "Enter 'restart' to restart from welcome screen"
get_next_move_minor(suit)
end


def prompt_for_input_major
puts "Would you like to continue?"
puts "Enter 'major' to go back to the list of major arcana cards"
puts "Enter 'next' to see the next card in the major arcana"
puts "Enter 'back' to see the previous card in the major arcana"
puts "Enter 'restart' to restart from welcome screen"
puts "Enter 'exit' to exit the program"
get_next_move_major
end


def get_next_move_minor(suit)
  user_input = gets.strip
  if user_input == "cards"
    list_suit(@current_suit_deck, @current_suit)
  elsif user_input == "next"
    if @current_card == @current_suit_deck.last
    puts "Cannot go next. This is the last card in the minor arcana."
    prompt_for_input_minor(suit)
  else
    @previous_card = @current_card
    @current_card = @current_suit_deck.find do |card|
    card.value_int == @previous_card.value_int + 1
    end
    system("clear")
    @current_card.info
    prompt_for_input_minor(suit)
  end
  elsif user_input == "back"
    if @current_card == @current_suit_deck.first
    puts "Cannot go back. This is the first card in this suit."
    prompt_for_input_minor(suit)
  else
    @previous_card = @current_card
    @current_card = @current_suit_deck.find do |card|
    card.value_int == @previous_card.value_int + 1
    end
    system("clear")
    @current_card.info
    prompt_for_input_minor(suit)
  end
elsif user_input == "restart"
    run
  elsif user_input == "exit"
    puts "Goodbye!!"
    sleep(2)
    system("clear")
    exit
  elsif user_input == "suits"
    minor_menu
  else
    puts "Invalid input. Please try again."
    sleep(1.5)
    system("clear")
    @current_card.info
    prompt_for_input_minor(suit)
  end
end


def get_next_move_major
  user_input = gets.strip
  if user_input == "major"
    print_major_arcana
  elsif user_input == "next"
    if @current_card == Card.major.last
    puts "Cannot go to next card. This is the last card in this suit."
    prompt_for_input_major
  else
    @previous_card = @current_card
    @current_card = Card.major.find do |card|
    card.value_int == @previous_card.value_int + 1
    end
    system("clear")
    @current_card.info
    prompt_for_input_major
  end
  elsif user_input == "back"
    if @current_card == Card.major.first
      puts "Cannot go back. This is the first card of this suit."
      prompt_for_input_major
    else
    @previous_card = @current_card
    @current_card = Card.major.find do |card|
    card.value_int == @previous_card.value_int - 1
    end
   system("clear")
   @current_card.info
   prompt_for_input_major
 end
elsif user_input == "restart"
    run
  elsif user_input == "exit"
    puts "Goodbye!!"
    sleep(2)
    system("clear")
    exit
  else
    puts "Invalid input. Please try again."
    sleep(1.5)
    system("clear")
    @current_card.info
    prompt_for_input_major
  end
end

end
