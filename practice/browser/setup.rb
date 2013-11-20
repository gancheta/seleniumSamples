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

module Setup
	def setup
       	 caps = Selenium::WebDriver::Remote::Capabilities.chrome
       	 caps.version = ""
    	 caps.platform = 'Linux'
       	 caps[:name] = "newProjectTest"

       	 @driver = Selenium::WebDriver.for(
     	     :remote,
     	     :url => "http://gancheta:8407a8e0-3210-4920-9e85-f0a4120356cf@ondemand.saucelabs.com:80/wd/hub",
   	       :desired_capabilities => caps)
	end
end
