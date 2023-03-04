# Manage-Book-With-VueJS

Hi, this is a simple Manage Book Topic in my Advanced Web Design subject 

# Technology
- FontEnd: VueJS, Vuetify, CSS, JavaScript
- BackEnd: .NET Web API
- DataBase: SQL Server

# Features
1. Login (validate)
2. Register (validate)
3. Manage User (Only admin role)
- 3.1 Admin tab, delete user out of admin user
- 3.2 User tab, add user to admin group
4. Manage Book (Only admin role)
- 4.1 Add new book
- 4.2 Change Information(Name, URL, Description)
- 4.3 Delete Book
5. See Publisher, detail publisher
6. Search book from publisher
7. Redirect when you've been login (basic local storage - not recommend)
8. Sign out

#HOW TO USE
1. Clone this repo
2. Run file ***.sql*** in Mirosoft SQL Management Studio to create the database
3. Open folder Font End in IDE(VSCode), open the Terminal(Ctrl + `), type ***npm install***
4. Open folder BackEnd, then run ***uanLySach.sln*** (IDE: Visual Studio), then find folder Database, choose DB.cs
config this line: connStr = @"Data Source=LOCNE\SQLEXPRESS;Initial Catalog=QLSach;Integrated Security=True"; -> change connection link to database you've created from step 1
5. Then click Run to run the localhost
6. Enjoy !!!

admin role sign in: username: admin, password: 1
user role sign in: user1, password: 1

# Some image from this project
- Database diagram
![Screenshot 2023-03-04 160656](https://user-images.githubusercontent.com/71368794/222906907-049b3dc6-ffb2-41bf-bc98-71e77a51a004.png)
- Login
![Screenshot 2023-03-04 155818](https://user-images.githubusercontent.com/71368794/222906806-c1203d05-bac5-4195-a017-4d378f5b4b6d.png)
- Validate
![Screenshot 2023-03-04 155828](https://user-images.githubusercontent.com/71368794/222906807-afb63534-5e84-4368-b56a-260b4535b43f.png)
- Register
![Screenshot 2023-03-04 155837](https://user-images.githubusercontent.com/71368794/222906814-2352e860-2a60-4e84-a274-34d966240269.png)
- Tab bar for admin role
![Screenshot 2023-03-04 155913](https://user-images.githubusercontent.com/71368794/222906819-1990fe81-927d-4b76-acdf-10bf010d3624.png)
- See Detail Publisher	
![Screenshot 2023-03-04 155935](https://user-images.githubusercontent.com/71368794/222906832-0ff28ef6-1290-4909-ae64-98c7c01d143f.png)
- Change information book
![Screenshot 2023-03-04 160009](https://user-images.githubusercontent.com/71368794/222906842-1ef3c6d6-efde-45e5-8f70-c4e416c0a602.png)
- Select image from Folder
![Screenshot 2023-03-04 160142](https://user-images.githubusercontent.com/71368794/222906848-e6004fd3-0378-4edb-be09-a46a04668513.png)
- Delete Book
![Screenshot 2023-03-04 160155](https://user-images.githubusercontent.com/71368794/222906844-4f3c5718-13e3-4aec-9894-7d332546cbf5.png)
- Show Description Book
![Screenshot 2023-03-04 160212](https://user-images.githubusercontent.com/71368794/222906854-b28243ff-78da-4111-ad35-f0c501a8b3e3.png)
- Add new Book
![Screenshot 2023-03-04 160313](https://user-images.githubusercontent.com/71368794/222906867-c0880899-0b04-4bdd-bf6d-2f53437f106c.png)
- Manage User - Admin tab - Only ADMIN ROLE
![Screenshot 2023-03-04 160353](https://user-images.githubusercontent.com/71368794/222906872-b5e878cd-5faf-4c1a-9a90-ef0d8f3e263d.png)
- Manage User - User tab - Only ADMIN ROLE
![Screenshot 2023-03-04 160344](https://user-images.githubusercontent.com/71368794/222906876-a5f011d2-eb6e-40fb-a089-f6faa8c2bda5.png)
- User not have add, change, delete function like admin
![Screenshot 2023-03-04 160426](https://user-images.githubusercontent.com/71368794/222906900-d0fdf18b-c81a-4d99-8010-cc22cf3834ff.png)

- Watch video

[![Watch the video](https://i.imgur.com/vKb2F1B.png)](https://www.youtube.com/watch?v=UHHVHgPEHeg&t=7s)



