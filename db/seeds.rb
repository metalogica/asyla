require 'date'

puts 'Cleaning database...'
Task.destroy_all
Goal.destroy_all
User.destroy_all
Category.destroy_all


puts 'Creating users...'
category_employment = Category.create!(name: 'Employment', colour: 'blue')
fouzia = User.create!(first_name: 'Fouzia', last_name: 'Al Hashish', age: 33, nationality: 'Syrian', language: 'Arabic', address: 'Toronto, Ontario', email: 'f.al_hashish@yahoo.fr', password: 'f.al_hashish@yahoo.fr')
nooshin = User.create!(first_name: 'Nooshin', last_name: 'Amineh', age: 25, nationality: 'Iranian', language: 'Persan', address: 'Halifax, Nova-Scotia', email: 'n.amineh@hotmail.com', password: 'n.amineh@hotmail.com')
axmed = User.create!(first_name: 'Axmed', last_name: 'Nuur', age: 39, nationality: 'Somalian', language: 'Arabic', address: 'Montreal, Quebec', email: 'a.nuur@gmail.com', password: 'a.nuur@gmail.com')
goal_employment = Goal.create!(name: 'Employment', category: category_employment, user: fouzia, completed: false)


date1 = Time.new(2019,2,5);
date2 = Time.new(2019,3,8);
date3 = Time.new(2019,3,8);

Task.create!(goal: goal_employment, title: 'DSH appointment', details: 'bljaljlfkjgla', deadline: date1, completed: false, address: 'Montreal')
Task.create!(goal: goal_employment, title: 'Employment appointment', details: 'bljaljlfkjgla', deadline: date2, completed: false, address: 'Montreal')
Task.create!(goal: goal_employment, title: 'Medical appointment', details: 'bljaljlfkjgla', deadline: date3, completed: true, address: 'Montreal')


puts 'Finished!'
