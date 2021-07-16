require 'rails_helper'

RSpec.describe 'CodeControllers', type: :request do
  let(:controller_path) { '/v1/code/' }
  let(:params_example) { build_stubbed(:params) }
  let(:id_example) { params_example[:id] }
  let(:code_example) { build_stubbed(:code) }
  let(:repository_class) { class_double(CodeRepository) }
  let(:repository_instance) { instance_double(CodeRepository) }
  let(:minifier_service_class) { class_double(CodeMinifierService) }
  let(:minifier_service_instance) { instance_double(CodeMinifierService) }
  let(:js_file) { fixture_file_upload('test_js_code.js') }

  before do
    allow(repository_class).to receive(:new).and_return(repository_instance)
    allow(minifier_service_class).to receive(:new).and_return(minifier_service_instance)
  end

  describe '#index' do
    context 'when code is found' do
      it 'responds with success' do
        get controller_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#create' do
    context 'when we send file' do
      it 'responds with success' do
        post controller_path, params: { raw_code: js_file }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#show' do
    context 'when we' do
      it 'responds with succes' do
        get "#{controller_path}/#{id_example}"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
