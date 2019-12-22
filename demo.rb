results = []

def saikoro
  (0..5).to_a.sample
end

def init_number
  init = Array.new(5)
  init.fill(0, 0..5)

  30.times do
    number = saikoro
    init[number] += 1
  end
  init
end

array = init_number
results << array

print array, "\n"

1000.times do
  out_index = saikoro
  in_index = saikoro

  dup_array = array.dup

  if dup_array[out_index] > 0
    dup_array[out_index] -= 1
    dup_array[in_index] += 1
  else
    puts out_index
    puts dup_array[out_index]
  end

  results << dup_array
  array = dup_array

  print dup_array, "\n"
end

print results, "\n"
puts results.count
