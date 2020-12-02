#### Permissions inside the database

This project uses the concept of RBAC, which allows to create roles & assign permissions.
The role name can be anything. The main point is that the project is not based roles rather it is based on permissions. 
You have to look at the API from the point of permissions. For example, role (let's call it) 'role-1' can create a user. 

#### note
permissions are hard coded & cannot be created using API

#### permissions
basics 
```text
a 1: sign-in
a 2: sign-up
```

admin (in old fashion)
```text
c 1: create / delete / update (info) user
c 2: get user or users
c 3: create / delete / update role
c 4: change user password
c 5: assign permissions to roles
```

user orientated
```text
d 1: create / delete / update / get board
d 2: change user password
```
