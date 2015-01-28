require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post('/surveys') do
  name = params.fetch("name")
  @survey = Survey.create({:name => name})
  @surveys = Survey.all
  erb(:index)
end

get("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey)
end

post("/questions") do
  description = params.fetch("description")
  survey_id = params.fetch("survey_id").to_i()
  question = Question.create({:description => description, :survey_id => survey_id})
  @survey = Survey.find(survey_id)
  erb(:survey)
end

get("/surveys/:id/edit") do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey_edit)
end

patch("/surveys/:id") do
  name = params.fetch("name")
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:name => name})
  erb(:survey)
end

delete("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.delete
  @surveys = Survey.all()
  erb(:index)
end

get("/questions/:id/edit") do
  @question = Question.find(params.fetch("id").to_i())
  erb(:question_edit)
end

patch("/questions/:id") do
  description = params.fetch("description")
  @question = Question.find(params.fetch("id").to_i())
  @question.update({:description => description})
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey)
end

delete("/questions/:id") do
  @question = Question.find(params.fetch("id").to_i())
  @question.delete()
  @questions = Question.all()
  erb(:survey)
end
