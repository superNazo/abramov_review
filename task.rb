class Task
  include Abramov
  include Library

  def initialize(id)
    @task = ("abramov_" + "#{id}").to_sym
  end

  def argumentize(num)
    @value = num
  end

  def just_run_it
    method(@task).call(@value)
  end
end
