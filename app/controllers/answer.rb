get	'/answers' do
	@answers = Answer.all

@answers2 = [
Answer.create(user_id: 2, question_id: 1, answer: "test 1"),
Answer.create(user_id: 1, question_id: 1, answer: "test 2"),
Answer.create(user_id: 1, question_id: 1, answer: "test 3"),
Answer.create(user_id: 2, question_id: 1, answer: "test 4"),
Answer.create(user_id: 1, question_id: 1, answer: "test 5"),
Answer.create(user_id: 1, question_id: 1, answer: "test 6"),
Answer.create(user_id: 2, question_id: 1, answer: "test 7")
]



	erb :"answers/index"
end											#display a list of all answers


 #get	'/answers/new' do		

 #end											#return an HTML form for creating a new answer


 post	'/answers' do
 	
 end											#create a new answer


# get	'/answers/:id' do

# end											#display a specific answer


# get	'/answers/:id/edit'	 do

# end											#return an HTML form for editing a answer



# put '/answers/:id' do

# end											#update a specific answer



# delete '/answers/:id' do

# end											#delete a specific answer



