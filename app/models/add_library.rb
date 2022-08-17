# frozen_string_literal: true

class AddLibrary < ApplicationRecord
  validates_uniqueness_of :heading
end
