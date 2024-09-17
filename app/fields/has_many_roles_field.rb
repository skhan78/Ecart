require "administrate/field/base"

class HasManyRolesField < Administrate::Field::Base
  def to_s
    data
  end
end
