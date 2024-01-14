class ApplicationController < ActionController::Base
  def parse_yaml(file)
    YAML::load(File.open(file))
  end
end
