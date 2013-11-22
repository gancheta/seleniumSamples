require 'rubygems'
require 'selenium-webdriver' 
require 'rspec/expectations'

# author: Ruvi-tess Tagala

#require  File.dirname(__FILE__) + '/locator'
#require  File.dirname(__FILE__) + '/events_admin'

class Setup  < Test::Unit::TestCase

  def initialize
    @driver = Selenium::WebDriver.for :firefox
    $url = "https://mc.la-1-9.morphlabs.net/"
    $wait_for_page = $driver.manage.timeouts.page_load = 20
    $wait_for_element = $driver.manage.timeouts.implicit_wait = 20
    $wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    @driver.get = $url
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

end



