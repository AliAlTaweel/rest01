# Restaurant Management System

## Overview

This project addresses a restaurant's issue with the quality of products stored in refrigeration. The owner requested a system that displays essential information on screen and prints stickers with details such as the **item name**, **production date**, **expiration date**, **weight**, and the name of the staff member responsible for the item.

## Database Schema

The system consists of six tables:

- **store**: Represents the refrigerator or any kind of storage.
- **person**: Contains the names and IDs of all staff members.
- **item**: Represents the products stored in the store.
- **person_role**: Contains roles and their associated IDs.
- **person_role_map**: Facilitates normalization between the person and person_role tables.
- **receipt**: Intended to contain raw materials; however, it is currently not utilized.

## Acknowledgments

I utilized [ChatGPT](https://openai.com/chatgpt) to assist with the creation of SQL insert statements for this project.

---

For more details, please refer to the [documentation](LINK_TO_DOCUMENTATION).
