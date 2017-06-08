

# sluggish octopus
# runs in O(n^2) time
def sluggish_octopus(fish)

  (0...fish.length-1).each do |idx1|
    (idx1+1...fish.length).each do |idx2|
      if fish[idx1].length > fish[idx2].length
        fish[idx1], fish[idx2] = fish[idx2], fish[idx1]
      end
    end
  end
  fish
end

# runs in O(n log n) time
def dominant_octopus(fish)
  return fish if fish.length < 2
  pivot_el = [fish.first]
  left = fish[1..-1].select { |el| el.length <= fish.first.length }
  right = fish[1..-1].select { |el| el.length > fish.first.length }
  dominant_octopus(left) + pivot_el + dominant_octopus(right)
end

# finds the longest fish in O(n) time
def clever_octopus(fish)
  longest = fish.first

  fish.each do |el|
    if el.length > longest.length
      longest = el
    end
  end
  longest
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
  'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

puts sluggish_octopus(fish).last
puts dominant_octopus(fish).last
puts clever_octopus(fish)

# dancing octopus
tiles_array = ["up", "right-up", "right", "right-down", "down",
  "left-down", "left",  "left-up" ]

# slow dance, takes O(n) time
def slow_dance(direction, tiles_array)
  (0...tiles_array.length).each do |index|
    if tiles_array[index] == direction
      return index
    end
  end
end

# fast dance, takes O(1) time
new_tiles_data_structure = {"up" => 0, "right-up" => 1, "right" => 2,
  "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,
  "left-up" => 7 }
def fast_dance(direction, new_tiles_data_structure)
  new_tiles_data_structure[direction]
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)
