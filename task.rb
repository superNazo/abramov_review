require_relative 'abramov_module'
require_relative 'library'

class Task
  include Abramov
  include Library

  attr_writer :user_input

  def initialize(id)
    @task = ("abramov_" + "#{id}").to_sym
    @data = $lib.detect { |i| i[:id] == id }
  end

  def just_run_it
    method(@task).call(@user_input)
  end

  def show(*params)
    params.each { |p| puts @data[p] }
  end
end
