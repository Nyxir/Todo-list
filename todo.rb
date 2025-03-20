todo_list = []

loop do
  welcome = [
  "\nWelcome to your To-Do List!",
  "What would you like to do?",
  "----------------------------------------------",
  "Add:    Add a new task to your To-Do list.",
  "Change: Change a task",
  "Remove: Remove a task from your To-Do list.",
  "View:   View your current To-Do list.",
  "Done:   Mark a task as done.",
  "Exit:   Exit the To-Do list.",
  "----------------------------------------------"
  ]
  puts welcome.join("\n")
  
  print "> "
  choice = gets.chomp.downcase

  case choice
  when "add"
    # Code to handle adding a task
    puts "What task would you like to add?"
    print "> "
    add_task = gets.chomp
    todo_list << add_task
    add_task = nil
    puts "Task added!"

  when "change"
    if todo_list.empty?
      puts "Your todo-list is empty"
    else
      todo_list.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end

    puts "Which task would you like to change?"
    print "> "
    change_task = gets.chomp.to_i
    index_to_modify = change_task - 1

    puts "Enter the new task"
    print "> "
    new_changed_task = gets.chomp

    if change_task > 0 && change_task <= todo_list.length
      todo_list[index_to_modify] = new_changed_task
      puts "Task changed!"
    else
      puts "Invalid task number. Please enter a valid number from the list."
    end


  when "remove"
    if todo_list.empty?
      puts "Your to-do list is empty"
    else
      todo_list.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end
    print "> "
    remove_task = gets.chomp.to_i
    index_to_modify = remove_task - 1

    if remove_task > 0 && remove_task <= todo_list.length
      todo_list.delete_at(index_to_modify)
      puts "Task removed!"
    else
      puts "Invalid task number. Please enter a valid number from the list."
    end

  when "view"
    # Code to handle viewing the list
    if todo_list.empty?
      puts "Your to-do list is empty"
    else
      puts "----------------------------------------------"
      todo_list.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
      puts "----------------------------------------------"
    end
    sleep(2) # Artificiell paus

  when "done"
    puts "Which task number is done?"
    if todo_list.empty?
      puts "Your to-do list is empty"
    else
      todo_list.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end
    print "> "
    done_task = gets.chomp.to_i
    index_to_modify = done_task - 1

    if done_task > 0 && done_task <= todo_list.length
      todo_list[index_to_modify] = "[DONE] " + todo_list[index_to_modify]
      puts "Task marked as done!"
    else
      puts "Invalid task number. Please enter a valid number from the list."
    end

  when "exit"
    puts "Goodbye!"
    break
  else
    puts "Invalid choice. Please try again."
  end
end