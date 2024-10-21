// src/routes/personRoutes.ts
import { FastifyInstance } from 'fastify';
import db from '../database';

const personRoutes = async (fastify: FastifyInstance) => {
  // Get all persons
  fastify.get('/persons', async (request, reply) => {
    try {
      const persons = await db
        .selectFrom('person')
        .selectAll()
        .execute();
      return persons;
    } catch (error) {
      reply.status(500).send(error);
    }
  });

  // Get a specific person by ID
  fastify.get('/person/:id', async (request, reply) => {
    const { id } = request.params as { id: number };
    try {
      const person = await db
        .selectFrom('person')
        .selectAll()
        .where('personid', '=', id)
        .executeTakeFirst();
      return person || { message: 'Person not found' };
    } catch (error) {
      reply.status(500).send(error);
    }
  });
};

export default personRoutes;
