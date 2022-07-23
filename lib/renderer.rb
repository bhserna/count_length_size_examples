def example(name, &block)
  puts
  puts "Example: #{name}"
  puts "---------" + "-" * name.length
  block.call
  puts 
end