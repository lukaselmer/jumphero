require 'gosu'

module GosuHelper
  module_function

  def m
    Gosu.milliseconds
  end

  def load_image(window, media_path)
    Gosu::Image.new(window, Media.path(media_path))
  end
end
