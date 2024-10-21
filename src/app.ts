// src/app.ts
import fastify from "fastify";
import personRoute from "./routes/presonRoutes";
import itemRoute from "./routes/itemRoutes";
import itemMaker from "./routes/itemMaker";

const app = fastify({ logger: true });

// Register routes
app.register(personRoute);
app.register(itemRoute);
app.register(itemMaker);

const start = async () => {
  try {
    await app.listen({ port: 3001 });
    app.log.info(`Server running at http://localhost:3000`);
  } catch (err) {
    app.log.error(err);
    process.exit(1);
  }
};

start();
