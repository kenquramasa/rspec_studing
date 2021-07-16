class CodeMinifierService < ApplicationService
  def call(code)
    code_minify(raw_code(code))
  end

  private

  def code_minify(code)
    Terser.new.compile(code)
  end

  def raw_code(code)
    code.nil? ? nil : code[:raw_code]
  end
end
