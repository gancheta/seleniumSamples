require 'rubygems'
require "test/unit"
require 'selenium-webdriver'

class Mcloud < Test::Unit::TestCase
   def setup
       @browser = Selenium::WebDriver.for :firefox
       @browser.get "https://mc.la-1-9.morphlabs.net/"
       @wait = Selenium::WebDriver::Wait.new(:timeout => 25)
       @def_admin='admin'
       @def_pass='klnm12'
       @username='automation10'
   end


    #user logs in 
    def test_login(username,password)
      @browser.get "https://mc.la-1-9.morphlabs.net/"
      @browser.find_element(:xpath,'//*[@id="username"]').send_keys(username)
      @browser.find_element(:xpath,'//*[@id="password"]').send_keys(password)
      @browser.find_element(:id, 'submit').click
      @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
      assert_equal "LOGOUT", @browser.find_element(:xpath, "//*[@id=\"inner_body\"]/div/div/div/header/p[1]/a[2]").text
    end

    #def test_logout
    #  @browser.find_element(:xpath, "//*[@id=\"inner_body\"]/div/div/div/header/p[1]/a[2]").click
    #  @wait
    #  assert_equal "Login", @browser.find_element(:id, 'submit').text
    #end

    def test_create_user
      test_login(@def_admin,@def_pass)
      email='automation10@gmail.com'
    #clicks Users tab and create new user
      @browser.find_element(:link_text, "USERS").click
      @browser.find_element(:xpath, '//*[@id="new-user"]').click
      @wait=Selenium::WebDriver::Wait.new(:timeout => 25)
      @browser.find_element(:name, 'name').send_keys(@username)
      @browser.find_element(:id, 'email').send_keys(email)
      @browser.find_element(:name, 'password').send_keys(@def_pass)
      @browser.find_element(:id, 'admin').click
      @browser.find_element(:id, 'create-user').click
      @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    #verify if success message for creating a user exists in the page
    #assert_equal(!!((@browser.find_element(:xpath,'//*[@id="alert-template"]')) =~ ('"' + @username + '" has been created.')), true)
    #  @browser.quit
    end

   def test_login_created_user
        test_login(@username,@def_pass)
    end

    def teardown
        @browser.quit
    end
end
