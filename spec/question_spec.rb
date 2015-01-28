require('spec_helper')

describe(Question) do
  it("validates presence of a description") do
    question = Question.new({:description => ""})
    expect(question.save()).to(eq(false))
  end

  it { should belong_to(:survey) }
end
