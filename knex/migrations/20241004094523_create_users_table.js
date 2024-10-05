exports.up = function(knex) {
  return knex.schema.createTable('users', function(table) {
    table.increments('id').primary(); // Auto-incrementing primary key
    table.string('name').notNullable(); // User name
    table.string('email').notNullable().unique(); // User email, unique constraint
    table.timestamps(true, true); // Adds created_at and updated_at columns with auto timestamp
  });
};

exports.down = function(knex) {
  return knex.schema.dropTableIfExists('users');
};