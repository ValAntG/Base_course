array = [0, 1]
array << array.last + array[-2] while array.last < 100
array.delete_at(-1)
puts array
