class ListCodeService < ApplicationService
  def call
    Code.all
  end
end