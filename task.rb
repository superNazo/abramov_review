require 'yaml'
require_relative 'abramov_module'

class Task
  include Abramov

  attr_writer :user_input

  def initialize(id)
    @task = ("abramov_" + "#{id}").to_sym
    @data = YAML.load_file('abramov.yml')["task_" + "#{id}"]
  end

  def just_run_it
    method(@task).call(*@user_input)
  end

  def show_info
    "\tAuthor: #{@data['author']} \n\tDescription: #{@data['description']}"
  end
end
