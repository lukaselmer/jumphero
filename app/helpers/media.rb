module Media
  module_function

  def path(file)
    project_home = File.expand_path('../..', File.dirname(__FILE__))
    File.join(project_home, 'media', file)
  end
end
