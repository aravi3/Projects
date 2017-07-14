require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    return "humans" if self.class_name == "Human"
    self.class_name.tableize
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults = {
      primary_key: :id,
      foreign_key: "#{name.to_s.singularize}_id".to_sym,
      class_name: "#{name.to_s.singularize.camelcase}"
    }

    options = defaults.merge(options)

    self.primary_key = options[:primary_key]
    self.foreign_key = options[:foreign_key]
    self.class_name = options[:class_name]
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = {
      primary_key: :id,
      foreign_key: "#{self_class_name.singularize.downcase}_id".to_sym,
      class_name: "#{name.singularize.camelcase}"
    }

    options = defaults.merge(options)

    self.primary_key = options[:primary_key]
    self.foreign_key = options[:foreign_key]
    self.class_name = options[:class_name]
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)

    define_method(name) do
      fkey = options.foreign_key
      mclass = options.model_class
      mclass.where(id: self.id).first
    end
  end

  def has_many(name, options = {})
    # options = HasManyOptions.new(name, options)

    # define_method(name) do
    #   fkey = options.foreign_key
    #   mclass = options.model_class
    #   mclass.where(id: self.id).first
    # end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
