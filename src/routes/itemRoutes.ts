// src/routes/itemRoutes.ts
import { FastifyInstance } from 'fastify';
import db from '../database';

const itemRoutes = async (fastify: FastifyInstance) => {
  // Get all items
  fastify.get('/items', async (request, reply) => {
    try {
      const items = await db
        .selectFrom('item')
        .selectAll()
        .execute();
      return items;
    } catch (error) {
      reply.status(500).send(error);
    }
  });

  // Get a specific item by ID
  fastify.get('/item/:id', async (request, reply) => {
    const { id } = request.params as { id: number };
    try {
      const item = await db
        .selectFrom('item')
        .selectAll()
        .where('itemid', '=', id)
        .executeTakeFirst();
      return item || { message: 'Item not found' };
    } catch (error) {
      reply.status(500).send(error);
    }
  });

  // Additional routes for creating, updating, and deleting items can be added here
};

export default itemRoutes;
