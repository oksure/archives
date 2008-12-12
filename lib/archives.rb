# = Archives
#   An easy interface to the Korea Government Archives Search OpenAPI (http://dev.naver.com/openapi/tutorial). By Hyunwoo Park.
#
# Author::    Hyunwoo Park <hwpark@oksurerails.com>
# Copyright:: Copyright (c) 2008 Hyunwoo Park <hwpark@oksurerails.com>
# License::   MIT <http://www.opensource.org/licenses/mit-license.php>
#
# USAGE:
#  require 'archives'
#  archives = Archives::Base.new('api_key')		### create a archives client
#  archives.request("한국전쟁")		### search without any options
#  archives.request("한국전쟁", {:rc_type => "rfile", :prod_year_start => "2005"})		### return RSS object defined in this gem
#  archives.request("한국전쟁", {:rt => "rfile", :pys => "2005"})		### you can use abbreviation
#  archives.request("한국전쟁").title		### return title of RSS object
#  archives.request("한국전쟁").items.each do |i|		### iteration over items
#    i.title		### title of each item
#  end

%w[cgi net/http libxml].each {|lib| require lib}

$:.unshift(File.join(File.dirname(__FILE__)))

require "archives/base"
require "archives/rss"
require "archives/item"

module Archives
  include LibXML

	# Abbreviation for passing options
	ABBREVIATION = {:rt => :rc_type, :pys => :prod_year_start, :pye => :prod_year_end, :pc => :prod_code, :pdc => :prod_dir_code,
									:io => :is_open, :or => :online_reading, :ret => :record_type, :dt => :doc_type, :mo => :mgt_organ,
									:s => :sort, :o => :order, :d => :display, :p => :pageno, :qp => :query_phrase, :qo => :query_or,
									:qe => :query_exclude, :qt => :query_type, :qf => :query_field}
end
