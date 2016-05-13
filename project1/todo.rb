
module Menu
    def menu
        puts "Welcome, here is your TODO list!
             1) add
             2) show
             3) update
             4) delete
             5) write to a file
             6) read from a file
             7) toggle a status
             q) quit"
    end
    def show_menu
        menu
    end

end

module Promptable
    def prompt(message="default message")
        puts message
        gets.chomp
    end
end


class List
    attr_reader :all_tasks
        def initialize
            @all_tasks=Array.new
            puts "A new TODO list is created!"
            end
        
        def add(content, status=false)
            task=Task.new(content,status)
            @all_tasks << task
            end
        
        def show
            @all_tasks.each.with_index{
            |task,i|
             puts "(#{i.next}) #{task.to_machine}"
            }
            end


        
        def write_to_file(filename)
            IO.write(filename, @all_tasks.map(&:to_machine).join("\n"))
        end

        def read_from_file(filename)
            IO.readlines(filename).each {  |x|
                status, content =x.split(':')
                status=status.include?('X')
                add(content.strip, status)
            }
        end

        def delete(num)
            @all_tasks.delete_at(num.to_i-1)
        end

        def update(task_number, content)
            task=Task.new(content)
            @all_tasks[task_number.to_i-1]=task

        end

        def toggle(num)
            all_tasks[num.to_i-1].toggle_status
        end




end


class Task
    attr_reader :description
    attr_accessor :status
    def initialize(description, status=false)
        @description=description
        @status=status
        puts "A task is created and the content is about #{@description}"
    end

        def completed
            puts @status
            @status
        end
        
         def to_s
             "#{represent_status} : #{@description}"
        end

        def to_machine
             "#{represent_status} : #{@description}"
        end

        def toggle_status
            @status=!@status
            puts @status
        end


        private
            def represent_status
                   "#{completed ? '[X]' : '[ ]' }"
            end


end


puts "This is TODO apps!" 
    include Menu
    include Promptable
   list=List.new    
   Menu.show_menu

loop do

    option=prompt("What would you like to do ? please enter a number")
    option.downcase!

case option 
    when "1"
        list.add(prompt("What's the task you want to do ?"))
    when "2"
        list.show

    when "3"
        list.update(prompt("which task you want to update?"),prompt("What is the new task content?"))

    when "4"
        list.delete(prompt("what's the number of the tasks?"))
    when '5'   
        list.write_to_file(prompt("what's the filename?"))
    when '6'
        list.read_from_file(prompt("what's the filename?"))
    when '7'
        list.toggle(prompt("which task you want to toggle"))

    when 'q'
        puts "Thank you for using the TODO apps"
        break
    else
        puts "
        none of the options you have choose
        Please enter a number of the following list:
        "
        Menu.show_menu

end 

end




