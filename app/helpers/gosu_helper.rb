require 'gosu'

module GosuHelper
  module_function

  def m
    Gosu.milliseconds
  end

  def load_image(media_path)
    Gosu::Image.new(Media.path(media_path))
  end

  def load_sound(media_path)
    Gosu::Song.new(Media.path(File.join('sound', media_path)))
  end

  def load_sample(media_path)
    Gosu::Sample.new(Media.path(File.join('sound', media_path)))
  end

  def floor_y
    665
  end
end
