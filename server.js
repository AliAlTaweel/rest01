// app.js
const fastify = require("fastify")({ logger: true });
const fastifyPlugin = require("fastify-plugin");
const pg = require("pg");

// Database connection setup
const dbClient = new pg.Client({
  user: "ali",
  host: "localhost",
  database: "rest01",
  password: "0770",
  port: 5432, // Default port for PostgreSQL
});

dbClient.connect();

// Register the database as a Fastify plugin
fastify.register(
  fastifyPlugin(async (fastify) => {
    fastify.decorate("db", dbClient);
  })
);

// Example route
fastify.get("/role", async (request, reply) => {
  try {
    const result = await fastify.db.query(
      `SELECT person.firstname, person.lastname, person_role.role 
      FROM person 
      INNER JOIN person_role_map ON person.personid = person_role_map.personid 
      INNER JOIN person_role ON person_role.roleid = person_role_map.roleid`
    );
    return result.rows;
  } catch (err) {
    fastify.log.error(err);
    reply.status(500).send("Internal Server Error");
  }
});
fastify.get("/makere", async (request, reply) => {
  try {
    const result = await fastify.db.query(
      `SELECT store.itemid, person.lastname, item.name
        FROM store
        INNER JOIN item on store.itemid = item.itemid
        INNER JOIN person on item.makerid = person.personid`
    );
    return result.rows;
  } catch (err) {
    fastify.log.error(err);
    reply.status(500).send("Internal Server Error");
  }
});

// Start the server
const start = async () => {
  try {
    await fastify.listen({ port: 3000 });
    fastify.log.info(`Server running at http://localhost:3000`);
  } catch (err) {
    fastify.log.error(err);
    process.exit(1);
  }
};

start();
