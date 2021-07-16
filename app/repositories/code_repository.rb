class CodeRepository < ApplicationRepository
  def initialize(code: default_code)
    @code = code
  end

  def add_code(raw_code)
    code.create(raw_code: raw_code)
  end

  def find_by_id(id)
    binding.pry
    code.find_by({ id: id })
    
  end

  private

  attr_reader :code

  def default_code
    Code
  end
end

# code.where({id: id})