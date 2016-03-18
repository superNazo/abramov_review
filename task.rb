class Task
  include Abramov
  include Library

  def initialize(id)
    @task = ("abramov_" + "#{id}").to_sym
    @id = id
    # @author = $lib.each { |i| return i[:author] if i[:id] == @id }
    # @description = $lib.each { |i| return i[:description] if i[:id] == @id }
  end

  def argumentize(num)
    @value = num
  end

  def just_run_it
    method(@task).call(@value)
  end

  def show_author
    @author = $lib.each { |i| return i[:author] if i[:id] == @id }
  end

  def show_desc
    @description = $lib.each { |i| return i[:description] if i[:id] == @id }
  end
end
