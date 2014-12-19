require 'spec_helper'

describe "Creating todo lists"  do #how to write tests: name of test, what u testing
	it "redirects to the todo list index page on success" do
			visit "/todo_lists"
			click_link "New Todo list"
			expect(page).to have_content("New todo_list")

			fill_in "Title", with: "My todo list"
			fill_in "Description", with: "This is what I'm doing today."
			click_button "Create Todo list"

			expect(page).to have_content("My todo list")
		end
	
	it "displays an error when the todo list has no title" do  #test for empty title
		expect(TodoList.count).to eq(0)

			visit "/todo_lists"
			click_link "New Todo list"
			expect(page).to have_content("New todo_list")

			fill_in "Title", with: ""
			fill_in "Description", with: "This is what I'm doing today."
			click_button "Create Todo list"

			expect(page).to have_content("error")
			expect(TodoList.count).to eq(0)

			visit "/todo_lists"
			expect(page).to_not have_content("This is what I'm doing today.")
	end

		it "displays an error when the todo list has a title less than 3 characters" do  #test for title <3 chara
		expect(TodoList.count).to eq(0)

			visit "/todo_lists"
			click_link "New Todo list"
			expect(page).to have_content("New todo_list")

			fill_in "Title", with: "Hi"
			fill_in "Description", with: "This is what I'm doing today."
			click_button "Create Todo list"

			expect(page).to have_content("error")
			expect(TodoList.count).to eq(0)

			visit "/todo_lists"
			expect(page).to_not have_content("This is what I'm doing today.")
	end

		it "displays an error when the todo list has no description" do  # test for empty description
		expect(TodoList.count).to eq(0)

			visit "/todo_lists"
			click_link "New Todo list"
			expect(page).to have_content("New todo_list")

			fill_in "Title", with: "Grocery list"
			fill_in "Description", with: ""
			click_button "Create Todo list"

			expect(page).to have_content("error")
			expect(TodoList.count).to eq(0)

			visit "/todo_lists"
			expect(page).to_not have_content("Grocery list")
	end

			it "displays an error when the todo list description is too short" do  # test for description length
		expect(TodoList.count).to eq(0)

			visit "/todo_lists"
			click_link "New Todo list"
			expect(page).to have_content("New todo_list")

			fill_in "Title", with: "Grocery list"
			fill_in "Description", with: "Food"
			click_button "Create Todo list"

			expect(page).to have_content("error")
			expect(TodoList.count).to eq(0)

			visit "/todo_lists"
			expect(page).to_not have_content("Grocery list")
	end
end