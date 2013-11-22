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
require 'rspec/expectations'
require File.expand_path('../Utility/setup',__FILE__)

class Users < Test::Unit::TestCase

  def test_sauce
    @browser= Setup.new
    @browser.find_element(:xpath,'//*[@id="username"]').send_keys('admin')
    @browser.find_element(:xpath,'//*[@id="password"]').send_keys('klnm12')
    @browser.find_element(:id, 'submit').click
    
	 #creates a user
    @browser.find_element(:link_text, "USERS").click
    @browser.find_element(:xpath, '//*[@id="new-user"]').click
    @browser.find_element(:id, 'username').send_keys('automated2')
    @browser.find_element(:id, 'email').send_keys('testing03mail+automated2@gmail.com')
    @browser.find_element(:id, 'password').send_keys('123qwe')
    @browser.find_element(:id, 'admin').click
    @browser.find_element(:id, 'create-user').click
    @browser.assert
  end

  def teardown
    @browser.quit
  end

end
