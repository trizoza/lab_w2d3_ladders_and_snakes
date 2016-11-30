grid =  "
 _____ _____ _____ _____
|     |     |     |     |
| %s  | %s  | %s  | %s  |
|_____|_____|_____|_____| 
|     |     |     |     |
| %s  | %s  | %s  | %s  |
|_____|_____|_____|_____|
|     |     |     |     |
| %s  | %s  | %s  | %s  |
|_____|_____|_____|_____|
|     |     |     |     |
| %s  | %s  | %s  | %s  |
|_____|_____|_____|_____|
"

puts grid
array = Array.new(["  "]*16)
ind1 = 4
ind2 = 6
if ind1 == ind2 
  array[ind1] = "xo"
else
  array[ind1] = " x"
  array[ind2] = " o"
end
puts grid % array


