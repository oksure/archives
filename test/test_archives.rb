# == IMPORTANT!
# This test consumes about 5 query quota of your API key.
# == 중요!
# 이 테스트 파일은 사용자 API Key에 할당된 분량 중, 약 5회 정도의 쿼리 수량을 소모합니다.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'archives'

class TestArchives < Test::Unit::TestCase

	# sets up basic setting for unit testing
	def setup
		# insert your own Archives API key
		@a = Archives::Base.new('your_key')
	end

	# test printing basic elements
	def test_basic_element
		a = @a.request("한국전쟁")
		puts a.title
		puts a.total
	end

	# test passing options
	def test_passing_options
		a = @a.request("한국전쟁", {:rc_type => "rfile", :prod_year_start => "2005"})
		puts a.title
		puts a.total
	end

	# test passing options in abbreviation
	def test_passing_options_abbreviation
		a = @a.request("한국전쟁", {:rt => "rfile", :pys => "2005"})
		puts a.title
		puts a.total
	end

	# test iteration over items
	def test_iteration_items
		a = @a.request("한국전쟁")
		a.items.each do |i|
			puts i.title
		end
	end

	# test all output fields
	def test_all_output_fields
		a = @a.request("한국전쟁")
		i = a.items.first
		puts i.rc_type
		puts i.rc_code
		puts i.rc_rfile_no
		puts i.rc_ritem_no
		puts i.title
		puts i.mgt_org_name
		puts i.prod_name
		puts i.prod_year
		puts i.is_open
		puts i.arcave_type
		puts i.doc_type
		puts i.online_reading
		puts i.link
	end
end
