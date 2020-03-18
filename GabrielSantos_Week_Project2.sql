# IS 361 GABRIEL SANTOS 03/18/2020
# My SCHEMA is called key_card_system 
# This project is where you show off your ability to 
# (1) translate a business requirement into a database design, 
# (2) design a database using one-to-many and many-to-many relationships, and 
# (3) know when to use LEFT and/or RIGHT JOINs to build result sets for reporting.
        
# An organization grants key-card access to rooms based on groups that key-card holders belong to. 
# You may assume that users below to only one group. Your job is to design the database that supports the key-card system.    
   
        DROP TABLE IF EXISTS Users;
            
        CREATE TABLE Users(
          UserId int PRIMARY KEY,
          UserName varchar(30) NOT NULL
        );
        
        INSERT INTO Users ( UserId, UserName ) VALUES ( 1, 'Modesto');
        INSERT INTO Users ( UserId, UserName ) VALUES ( 2, 'Ayine');
        INSERT INTO Users ( UserId, UserName ) VALUES ( 3, 'Christopher');
        INSERT INTO Users ( UserId, UserName ) VALUES ( 4, 'Cheong');
        INSERT INTO Users ( UserId, UserName ) VALUES ( 5, 'Saulat');
        INSERT INTO Users ( UserId, UserName ) VALUES ( 6, 'Heidy');
        SELECT * FROM Users;
        
		DROP TABLE IF EXISTS Groupss;
       
        
        CREATE TABLE Groupss (
          GroupId int PRIMARY KEY,
          GroupName varchar(30) NOT NULL
        );
        
        INSERT INTO Groupss( GroupId, GroupName ) VALUES ( 21, 'I.T.');
        INSERT INTO Groupss ( GroupId, GroupName ) VALUES ( 22, 'Sales');
        INSERT INTO Groupss ( GroupId, GroupName ) VALUES ( 23, 'Administration');
        INSERT INTO Groupss ( GroupId, GroupName ) VALUES ( 24, 'Operations');
        SELECT * FROM Groupss;
        
		DROP TABLE IF EXISTS Rooms;
             
        CREATE TABLE Rooms(
          RoomId int PRIMARY KEY,
          RoomName varchar(30) NOT NULL
        );
        
        INSERT INTO Rooms ( RoomId, RoomName ) VALUES ( 101, '101');
        INSERT INTO Rooms ( RoomId, RoomName ) VALUES ( 102, '102');
        INSERT INTO Rooms ( RoomId, RoomName ) VALUES ( 103, 'Auditorium A');
        INSERT INTO Rooms ( RoomId, RoomName ) VALUES ( 104, 'Auditorium B');
        SELECT * FROM Rooms;
        
		DROP TABLE IF EXISTS UsersGroups;
     
        
        CREATE TABLE UsersGroups (
          UgId int PRIMARY KEY,
          UserId int NOT NULL,
          GroupId int NOT NULL
        );
        
        INSERT INTO UsersGroups ( UgId, UserId, GroupId ) VALUES ( 121, 1, 21);
        INSERT INTO UsersGroups ( UgId, UserId, GroupId ) VALUES ( 122, 2, 21);
        INSERT INTO UsersGroups ( UgId, UserId, GroupId ) VALUES ( 123, 3, 22);
        INSERT INTO UsersGroups ( UgId, UserId, GroupId ) VALUES ( 124, 4, 22);
        SELECT * FROM UsersGroups;
        
		DROP TABLE IF EXISTS GroupsRooms;
                    

        CREATE TABLE GroupsRooms(
          GrId int PRIMARY KEY,
          GroupId int NOT NULL,
          RoomId int NOT NULL
        );
        
        INSERT INTO GroupsRooms ( GrId, GroupId, RoomId ) VALUES ( 1101, 21, 101);
        INSERT INTO GroupsRooms ( GrId, GroupId, RoomId ) VALUES ( 1102, 21, 102);
        INSERT INTO GroupsRooms ( GrId, GroupId, RoomId ) VALUES ( 1103, 22, 102);
        INSERT INTO GroupsRooms ( GrId, GroupId, RoomId ) VALUES ( 1104, 22, 103);
        
        SELECT * FROM GroupsRooms;
        
        DROP TABLE IF EXISTS UsersGroupsRooms;           
        
        CREATE TABLE UsersGroupsRooms (
          UgrId int PRIMARY KEY,
          UserId int NOT NULL,
          GroupId int NOT NULL,
          RoomId int NOT NULL
        );
        
        INSERT INTO UsersGroupsRooms ( UgrId, UserId, GroupId, RoomId ) VALUES ( 2101, 1, 21, 101);
        INSERT INTO UsersGroupsRooms ( UgrId, UserId, GroupId, RoomId ) VALUES ( 2102, 2, 21, 102);
        INSERT INTO UsersGroupsRooms ( UgrId, UserId, GroupId, RoomId ) VALUES ( 2103, 3, 22, 102);
        INSERT INTO UsersGroupsRooms ( UgrId, UserId, GroupId, RoomId ) VALUES ( 2104, 4, 22, 103);
        
        SELECT * FROM UsersGroupsRooms; 
        
        
        
# Write SELECT statements that provide the following information:
# • All groups, and the users in each group. A group should appear even if there are no users assigned to the group.
# • All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them.
# • A list of users, the groups that they belong to, and the rooms to which they are assigned.
# This should be sorted alphabetically by user, then by group, then by room.

 SELECT 
 a.GroupName AS 'GROUP NAME' , 
 b.UserName  AS 'NAME'
 FROM Users b 
 INNER JOIN UsersGroups ug ON b.UserId = ug.UserId 
 RIGHT JOIN Groupss a ON ug.GroupId = a.GroupId;
      
SELECT 
a.RoomName AS 'ROOM',
b.GroupName AS 'GROUP'
FROM Groupss b 
INNER JOIN GroupsRooms gr 
ON b.GroupId = gr.GroupId 
RIGHT JOIN Rooms a ON gr.RoomId = a.RoomId;
      
SELECT 
a.UserName AS 'NAME',
b.GroupName AS 'GROUP',
c.RoomName AS 'ROOM' 
FROM Users a 
INNER JOIN UsersGroupsRooms ugr ON a.UserId = ugr.UserId 
INNER JOIN Groupss b ON ugr.GroupId = b.GroupId 
INNER JOIN Rooms c ON ugr.RoomId = c.RoomId
ORDER BY UserName, GroupName, RoomName;




