#!/usr/bin/env ruby
=begin
require 'rubygems'
require 'selenium-webdriver'

caps = Selenium::WebDriver::Remote::Capabilities.firefox
caps.platform = 'Linux'
caps.version = '23'
caps[:name] = "Testing Selenium 2 with Ruby on Sauce"

driver = Selenium::WebDriver.for(
  :remote,
  :url => "http://gancheta:8407a8e0-3210-4920-9e85-f0a4120356cf@ondemand.saucelabs.com:80/wd/hub",
  :desired_capabilities => caps)

driver.navigate.to "http://www.google.com"
element = driver.find_element(:name, 'q')
element.send_keys "Hello WebDriver!"
element.submit
puts driver.title
driver.quit


#https://saucelabs.com/docs/platforms/webdriver

=end

require 'rubygems'
require "test/unit"
require 'selenium-webdriver'
#require File.expand_path('../October/browser/setup',__FILE__)

class ExampleTest < Test::Unit::TestCase

#include Setup

   def setup
       @browser = Selenium::WebDriver.for :firefox
       @browser.get "https://mc.la-1-9.morphlabs.net/"
       @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
   end

    def test_sauce
        @browser.find_element(:xpath,'//*[@id="username"]').send_keys('admin')
	@browser.find_element(:xpath,'//*[@id="password"]').send_keys('klnm12')
        @browser.find_element(:id, 'submit').click
        #@browser.find_element(:xpath,'//*[@id="navHome"]/a').click
        #@driver.find_element(:id, 'Jirurie').click
    end

    def teardown
        @browser.quit
    end
end
