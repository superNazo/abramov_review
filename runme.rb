require_relative 'abramov_module'
require_relative 'library'
require_relative 'task'

# test = Task.new('86a')
# p test.show_author
# p test.show_desc

def test_task
  puts 'Type the task id u want to run: '
  task_id = gets.chomp

  task = Task.new(task_id)

  puts 'Type your number: '
  number = gets.chomp.to_i

  task.argumentize(number)
  puts task.just_run_it

  puts "To show author and description - type 'i', to skip - enter"
  if gets.chomp == 'i'
    puts task.show_author
    puts task.show_desc
  end
end

def continue?
  puts 'Would u like to continue [Y/N]?'
  answer = gets.chomp

  answer.downcase == 'y'
end

loop do
  test_task
  break unless continue?
end
