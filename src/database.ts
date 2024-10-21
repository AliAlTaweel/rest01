import { Kysely, PostgresDialect } from "kysely";
import { Pool } from "pg";
import * as dotenv from "dotenv";

dotenv.config();

// Define your database schema here based on your SQL schema
export interface DatabaseSchema {
   receipt:{
    receiptid: number;
    receiptname: string;
    date: number;
   };

person:{
    personid: number;
    firstname: string;
    lastname :string;
};

item :{
    itemid : number;
    name : string;
    weight: number;
    pdate :number;
    expdate :number;
    receiptid : number;
    makerid :number;
};

store : {
    storeid: number;
    itemid : number;
    itemname :number;
};
  
person_role:{
    roleid :number;
    role :number;
};

person_role_map: {
    personid:number;
    roleid: number;
};
}

// Create a PostgreSQL connection pool
const pool = new Pool({
  host: process.env.DB_HOST || "localhost",
  port: Number(process.env.DB_PORT) || 5432,
  user: process.env.DB_USER || "ali",
  password: process.env.DB_PASSWORD || "0770",
  database: process.env.DB_NAME || "rest01",
});

// Create the Kysely database instance
const db = new Kysely<DatabaseSchema>({
  dialect: new PostgresDialect({
    pool: pool, // Use the Pool for database connections
  }),
});

export default db;
