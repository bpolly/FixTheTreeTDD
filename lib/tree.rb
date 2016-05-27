class NoApplesError < StandardError; end

class AppleTree
  attr_accessor :height, :age, :apples, :alive

  def initialize
    @age = 0
    @height = 0
    @alive = true
    @apples = []
    @age_to_bear = ((rand 97) % 5) + 5
    @max_height = 30
    @max_age = 50
  end

  def age!
    @age = @age + 1
    if(@age > @age_to_bear)
      add_apples
    end
    # while height < 30 feet, add 0-2 feet
    @height += (rand 3) if @height < @max_height
  end

  def add_apples
    rand(90..200).times do
      @apples.push(Apple.new("red", rand(4)+1))
    end
  end

  def any_apples?
    @apples.size != 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?

    # remove and returns first apple object in array
    @apples.shift
  end

  def dead?
    @age > @max_age
  end
end

class Tree < AppleTree

end

class Fruit
  def initialize
    has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

  def initialize(color, diameter)
    @color = color
    @diameter = diameter
  end
end

#THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = Tree.new

  tree.age! until tree.any_apples?

  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []

    # It places the apple in the basket
    while tree.any_apples?
      basket << tree.pick_an_apple!
    end

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    # It's up to you to calculate the average diameter for this harvest.
    avg_diameter = (diameter_sum*1.0) / basket.size if basket.size > 0
    avg_diameter = avg_diameter.round(2)

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
 #tree_data
