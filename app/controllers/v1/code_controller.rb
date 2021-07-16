module V1
  class CodeController < ApplicationController
    def index
      render json: list_code_service.call
    end

    def create
      render json: create_code_service.call(code_reader)
    end

    def show
      render json: code_minifier_service.call(code_repository.find_by_id(code_id))
    end

    private

    def code_params
      params.permit(:raw_code)
    end

    def code_reader
      code_params[:raw_code].read
    end

    def code_id
      params[:id]
    end

    def list_code_service
      ListCodeService.new
    end

    def create_code_service
      CreateCodeService.new
    end

    def code_minifier_service
      CodeMinifierService.new
    end

    def code_repository
      CodeRepository.new
    end
  end
end
