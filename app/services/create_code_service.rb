class CreateCodeService < ApplicationService
  def call(raw_code)
    code_repository.add_code(raw_code)
  end

  private

  def code_repository
    CodeRepository.new
  end
end
