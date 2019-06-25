array = [0, 1]
array << array.last + array[-2] while array.last < 100
array.delete_at(-1)
puts array

# array = [0, 1]
# for i in 0..15
#   array.push(array.last + array[-2]) if array.last < 100
# end
# array.delete_at(-1)
# puts array
