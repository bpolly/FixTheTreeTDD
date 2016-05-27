require 'rspec'
require 'tree'

describe 'Tree' do
  it 'should be a AppleTree' do
    tree = Tree.new
    expect(tree).to be_a AppleTree
  end

  it 'should grow to 32 feet or less' do
    tree = Tree.new
    50.times do
      tree.age!
    end
    expect(tree.height).to be <= 32
  end

  it 'should wait wait until at least year 5 to grow apples' do
    tree = Tree.new
    5.times do
      tree.age!
    end
    expect(tree.any_apples?).to be false
  end

  it 'should be dead after 100 years' do
    tree = Tree.new
    100.times do
      tree.age!
    end
    expect(tree.dead?).to be true
  end

end

describe 'Fruit' do

end

describe 'Apple' do
  it 'should have red color' do
    a = Apple.new("red",1)
    expect(a.color).to eq("red")
  end

  it 'should have a diameter of 6' do
    a = Apple.new("red",6)
    expect(a.diameter).to eq(6)
  end

  it 'should be a fruit' do
    expect(Apple.new("red",6)).to be_a Fruit
  end
end
