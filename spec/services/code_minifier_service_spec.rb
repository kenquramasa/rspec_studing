require 'rails_helper'

describe CodeMinifierService, type: :service do
  context '#call' do
    let(:code_example) { build_stubbed(:code) }
    let(:results) { described_class.new.call(code_example) }
    let(:terser_class) { class_double(Terser) }
    let(:terser_instance) { instance_double(Terser) }
    let(:minified_code) do
      'let y=s.reduce(((e,l)=>e<=l?e:l)),m=y.length,l=m;'
    end

    before do
      allow(terser_class).to receive(:new).and_return(terser_instance)
      allow(terser_instance).to receive(:compile).with(raw_code).and_return(minified_code)
    end

    it 'returns minified code', :aggregate_failures do
      expect(results).to eq(minified_code)
      # expect(terser_class).to have_received(:new)
      # expect(terser_instance).to have_received(:compile).with(raw_code)
    end
  end
end
