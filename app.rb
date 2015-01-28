require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post('/survey') do
  name = params.fetch("name")
  @survey = Survey.create({:name => name})
  @surveys = Survey.all
  erb(:index)
end
