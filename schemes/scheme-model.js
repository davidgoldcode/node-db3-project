const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  return db("steps").where({ id }).first();
}

function add(data) {
  return db("schemes")
    .insert(data, "id")
    .then((ids) => {
      const id = ids[0];
      return findById(id);
    });
}

function remove(id) {
  return db("schemes").where({ id }).del();
}
