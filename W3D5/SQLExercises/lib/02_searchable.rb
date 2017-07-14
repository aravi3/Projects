require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = []

    params.each do |attr_name, val|
      if val.is_a?(String)
        where_line << "#{attr_name} = '#{val}'"
      else
        where_line << "#{attr_name} = #{val}"
      end
    end

    where_line = where_line.join(" AND ")

    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_line}
    SQL

    return [] if results.empty?

    results.map { |result| self.new(result) }
  end
end

class SQLObject
  extend Searchable
end
