#!/usr/bin/env ruby
require 'io/console'
require 'net/http'
require 'open-uri'

#Simple DIR/File bruteforcer for recon work.
#Currently using txt files avaible on secLists
#This is not a complete project but it shoud
#Get the basic work done
#I thought I'd Share :)
#Written By Behrouz Sadeghipour


class String
def black;          "\e[30m#{self}\e[0m" end
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def brown;          "\e[33m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def magenta;        "\e[35m#{self}\e[0m" end
def cyan;           "\e[36m#{self}\e[0m" end
def brown;           "\e[37m#{self}\e[0m" end
def gray;           "\e[37m#{self}\e[0m" end

def bg_black;       "\e[40m#{self}\e[0m" end
def bg_red;         "\e[41m#{self}\e[0m" end
def bg_green;       "\e[42m#{self}\e[0m" end
def bg_brown;       "\e[43m#{self}\e[0m" end
def bg_blue;        "\e[44m#{self}\e[0m" end
def bg_magenta;     "\e[45m#{self}\e[0m" end
def bg_cyan;        "\e[46m#{self}\e[0m" end
def bg_brown;        "\e[47m#{self}\e[0m" end

def bold;           "\e[1m#{self}\e[22m" end
def italic;         "\e[3m#{self}\e[23m" end
def underline;      "\e[4m#{self}\e[24m" end
def blink;          "\e[5m#{self}\e[25m" end
def reverse_color;  "\e[7m#{self}\e[27m" end
end

system "clear"

def sor_res_code(res, targetURI)
  case res.code
    when "401"
      print ("PROTECTED DIR AT:" + targetURI).gray
    when "200"
      print ("200 FOUND AT: " + targetURI).green
    when "403"
      print ("FORBIDDEN AT: " + targetURI).red
    when "302"
      print ("REDIRECTION AT: " + targetURI).gray
    end
end

def get_response_code(targetURI)
  begin
    if targetURI.include?("http://")
      res = Net::HTTP.get_response(URI.parse(targetURI))
      sor_res_code res, targetURI
    else
      res = Net::HTTP.get_response(URI.parse("http://"+targetURI))
      sor_res_code res, targetURI
    end
  rescue URI::InvalidURIError
  end
end



def openFile(file_name, getURI)
File.open(file_name, "r") do |f|
  f.each_line do |line|
    targetURI =  getURI + "/" + line
    #puts targetURI
    get_response_code(targetURI)
    end
  end
end


puts "Please enter target URL (example: hackme.org)"

userURI = gets.chomp
getURI = userURI.gsub(/\/$/, '')

puts "What are we fuzzing?
          1:   Wordpress
          2:   Cold Fusion
          3:   Drupal
          4:   Joomla
          5:   PHP-Nuke
          6:   Magento
          7:   Sharepoint
          8:   Common PHP Files
          9:   Look for backup files
          10:  Apache Default Files
          11:  IIS Default Files
          12:  Miscellaneous Files (SVN, robots, etc).
          0:  Other\n\n"
puts "Please enter an option:"
choice = gets.chomp

if choice == "1"
  file_name = "CMS/wordpress.txt"
  fuzz_name = "Wordpress"
elsif choice == "2"
    file_name =  "CMS/coldFusion.txt"
    fuzz_name = "Cold Fusion"
elsif choice ==  "3"
    file_name = "CMS/drupal.txt"
    fuzz_name = "Drupal"
elsif choice ==  "4"
    file_name = "CMS/joomla.txt"
    fuzz_name = "Joomla"
elsif choice ==  "5"
    file_name = "CMS/phpnuke.txt"
    fuzz_name = "PHP-Nuke"
elsif choice ==  "6"
    file_name = "CMS/magento.txt"
    fuzz_name = "Magento"
elsif choice ==  "6"
    file_name = "CMS/sharepoint.txt"
    fuzz_name = "Sharepoint"
elsif choice ==  "8"
    file_name = "common/php.txt"
    fuzz_name = "Common PHP"
elsif choice ==  "9"
    file_name = "common/backupFiles.txt"
    fuzz_name = "Backup"
elsif choice ==  "10"
    file_name = "webserver/apache.txt"
    fuzz_name = "Apache"
elsif choice ==  "11"
    file_name = "webserver/iis.txt"
    fuzz_name = "IIS"
elsif choice ==  "12"
    file_name = "others/misc.txt"
    fuzz_name = "Miscellaneous, config"
elsif choice ==  "0"
    puts "Please enter path to file: "
    file_name = gets.chomp
    fuzz_name = "random user"
else
    puts "Invalid - try again"
end

if File.file?(file_name)
  puts "fuzzing " + getURI + " looking for " + fuzz_name + " files."
  puts "-----------------------------------------------------------------\n"
  openFile file_name, getURI
  puts "-----------------------------------------------------------------\n"
else
  puts "File Does Not Exist"
end
