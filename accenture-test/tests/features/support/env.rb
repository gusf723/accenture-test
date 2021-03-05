require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'page_helper.rb'
require 'pry'

World(PageObjects)

def load_yaml_file(path)
  YAML.load_file(File.dirname(__FILE__) + path)
end

STANDARD_DATA = load_yaml_file('/data/data.yaml')

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.default_max_wait_time = 5
end