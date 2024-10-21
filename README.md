## Restaurant Inventory Management System
## Overview
This system addresses a problem the restaurant has with maintaining the quality of products stored in the refrigerator or storage. The owner requested a system that displays product details on-screen and prints them on stickers, including the item name, production date, expiration date, weight, and the name of the responsible staff member.
(This min-project is based on a real-life case for a restrant name "YABA BY CHEF SHAHEEN" )

## Database Schema
The system consists of six tables:

- **store**: Represents the refrigerator or any kind of storage.
- **person**: Contains the names and IDs of all staff members.
- **item**: Represents the products stored in the store.
- **person_role**: Contains staff memeber roles and their associated IDs.
- **person_role_map**: Facilitates normalization between the person and person_role tables.
- **receipt**: Intended to contain raw materials; however, it is currently not utilized.
## Acknowledgments
- I utilized ChatGPT to assist with the creation of SQL insert statements for this project.
- i attached to it my restaurant database scheme.
- i add to .env scheme user name and passweord.
- for api, i used fastify nodejs, till this moment its only retreive data from database, i got output from the next two queries.
## Select Examples
- Exp. 1
this query retrieve firstname , lastname and role. from three tables using inner join:

          SELECT person.firstname, person.lastname,
          person_role.role
          FROM person
          INNER JOIN person_role_map ON person.personid = person_role_map.personid
          INNER JOIN person_role ON person_role.roleid = person_role_map.roleid;
  the api url for this query 

- Exp.2
fetech the maker lastname, item name , for items stored in store

          SELECT store.itemid, person.lastname, item.name
          FROM store
          INNER JOIN item on store.itemid = item.itemid
          INNER JOIN person on item.makerid = person.personid
