# frozen_string_literal: true

class TodoItem < ApplicationRecord
  belongs_to :todo_list

  validates :description, length: { maximum: 1000 }, presence: true
end
