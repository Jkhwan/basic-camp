Page List
=========

1. `/`
  * display front-page with registration form and login link 
- `/users/login - users#new`
  * user login page with a form for submitting user info (username, firstname, lastname, email, password, password_confirmation)
  * signup button that links back to front page
- `/my/projects - projects#index`
  * displays all projects, each project div will link to their respective project (also shows a brief description and number of members)
  * add button to link to projects#new
  * search bar to search by project name
  * link at the top to access user account
- `/my/projects/:id - projects#show`
  * show a specific project page
  * displays top 5 most recent messages
  * displays top 5 todos based on due date
  * link to add new discussion
  * link to add todos
  * link to delete project (only for project creator)
- `/my/projects/:id/new - projects#new` 
  * create a new project
  * form to enter name and description of project, add users to project
- `/my/projects/:id/participants - participants#index`
  * views all participants with access to this project
  * add and remove participant (only viewable by project creator)
- `/my/projects/:id/todos - todos#index` 
  * view all todos for this project
  * could sort by due dates or importance
  * link to add new todos
  * edit and delete button for each todo
- `/my/projects/:id/todos/new - todos#new`
  * add new todo
  * Enter name and due date
- `/my/projects/:id/todos/:todo_id/edit - todos#edit`
  * edit specific todo
  * edit name and due date
  * delete todo
- `/my/projects/:id/discussions - discussions#index`
  * show all discussion topics
  * link to add new discussion
  * view 5 most recent messages for each discussion
  * delete button to remove specific discussion
- `/my/projects/:id/discussions/:dis_id - discussions#show`
  * show a particular discussion topic
  * listing all messages that belongs to that topic
  * link to add message to the discussion
  * sorted by desc posted time
  * click on message title to expand to show full message
  * author and time for each message shown
  * edit and delete link for each message (only shown for original author of message)
- `/my/projects/:id/discussions/:dis_id/messages/:msg_id/new - messages#new`
  * textbox to enter subject, message
  * save and cancel button
  * back to go back to discussion
- `/my/projects/:id/discussions/:dis_id/messages/:msg_id/edit - messages#edit`
  * textbox to edit existing subject, message
  * save, cancel, and delete button
  * back to go back to discussion
