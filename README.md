# Restaurant

## Overview

There is a restaurant has problem isuu whith the quality of products that stores or put it in the refrigerator, so the owner asked of king of system shows on screen and print on stickers details such as the **item name**, **production date**, **expiration date**, **weight**, and the name of the staff member responsible for the item.

## Database Schema

The system consists of six tables:

- **store**: Represents the refrigerator or any kind of storage.
- **person**: Contains the names and IDs of all staff members.
- **item**: Represents the products stored in the store.
- **person_role**: Contains roles and their associated IDs.
- **person_role_map**: Facilitates normalization between the person and person_role tables.
- **receipt**: Intended to contain raw materials; however, it is currently not utilized.

## Acknowledgments

-** I utilized [ChatGPT](https://openai.com/chatgpt) to assist with the creation of SQL insert statements for this project.
-** i used lecture 8 materials , i attached to it my restaurant database scheme.
-** i add to .env.example scheme user name and passweord.
for api, i still tring to make it work.

---
