class Search < ActiveRecord::Base
	
	# Doing the full text search in sql
	#
	# @param query is a string to be searched
	# @return array
	def self.full_text_search(query)
		sql = "SELECT id, name, address, postal_code, category_name, country_name, "
  	sql << "MATCH(name, address, category_name, country_name) AGAINST('#{query}') AS score "
  	sql << "FROM searches WHERE MATCH(name, address, category_name, country_name) AGAINST('#{query}');"
	
  	self.find_by_sql(sql)
	end
end