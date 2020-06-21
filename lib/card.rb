

class Card
attr_accessor :type, :name_short, :name, :value, :value_int, :meaning_up, :meaning_rev, :desc, :suit
@@all = []
@@minor = []
@@major = []
@@wands = []
@@cups = []
@@pentacles = []
@@swords = []
def initialize(attributes)
  attributes.each {|key, value| self.send(("#{key}="), value)}
  @@all << self
  @@minor << self if @type == "minor"
  @@major << self if @type == "major"
  @@wands << self if @suit == "wands"
  @@cups << self if @suit == "cups"
  @@pentacles << self if @suit == "pentacles"
  @@swords << self if @suit == "swords"
  @suit = "none" if @suit == nil
  @this_art = Card_art.new(@value_int, @suit)
end

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
  @@minor.clear
  @@major.clear
  @@wands.clear
  @@cups.clear
  @@pentacles.clear
  @@swords.clear
end

def self.minor
 @@minor.sort {|a, b| a.value_int <=> b.value_int}
end

def self.major
  @@major.sort {|a, b| a.value_int <=> b.value_int}
end

def self.wands
  @@wands.sort {|a, b| a.value_int <=> b.value_int}
end

def self.cups
  @@cups.sort {|a, b| a.value_int <=> b.value_int}
end

def self.pentacles
  @@pentacles.sort {|a, b| a.value_int <=> b.value_int}
end

def self.swords
  @@swords.sort {|a, b| a.value_int <=> b.value_int}
end

def art
@this_art.display
end

def info_abridged
  puts "Here's your card of the day:"
  puts ""
    puts ""
  puts "Name: #{@name}"
  puts ""
  puts "Type: #{@type}"
  puts "Number: #{@value_int}"
  puts "Suit: #{@suit}"
  art
  puts ""
  puts "Upright meaning: #{@meaning_up}"
  puts ""
  puts "Reversed meaning: #{@meaning_rev}"
  puts ""
  puts ""
  puts
end

def info
  puts "Type: #{@type}"
  puts ""
  puts "Name: #{@name}"
  puts ""
  puts "Value: #{@value}"
  puts ""
  puts "Number: #{@value_int}"
  art
  puts ""
  puts "Upright meaning: #{@meaning_up}"
  puts ""
  puts "Reversed meaning: #{@meaning_rev}"
  puts ""
  puts "Description: #{@desc}"
  puts ""
  puts
end



end
