require_relative 'task'

puts '=' * 25 + ' Abramov tasks review ' + '=' * 25

def review_task
  print "Type the task id u want to run: \n=> "
  task_id = gets.chomp

  task = Task.new(task_id)
  print "-" * 80 + "\n#{task.show_info}\n" + "-" * 80

  print "\nEnter argument or multiple arguments (separated with comma): \n=> "
  args = gets.chomp.split(',').map(&:to_i)

  task.user_input=args
  print "Result: \n=> " + "#{task.just_run_it}\n" + "-" * 80
end

def continue?
  print "Would u like to continue [Y/N]?\n=> "
  answer = gets.chomp
  answer.downcase == 'y'
end

loop do
  review_task
  break unless continue?
end
