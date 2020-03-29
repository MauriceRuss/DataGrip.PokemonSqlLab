#What is each pokemons primary type?
select pokemons.name, types.name
from pokemons
join types on pokemons.primary_type = types.id;

#What is Rufflet's secondary type?
SELECT pokemons.name, types.name AS "Secondary Type"
FROM pokemons
INNER JOIN types ON pokemons.secondary_type = types.id
WHERE pokemons.name = 'Rufflet';

#What are the names of the pokemon that belong to the trainer with trainerID 303?
select pokemon_trainer.trainerID,trainers.trainername, GROUP_CONCAT(pokemons.name)
from pokemon_trainer
join pokemons on pokemon_id = pokemons.id
join trainers on pokemon_trainer.trainerID = trainers.trainerID
where pokemon_trainer.trainerID=303
group by pokemon_trainer.trainerID,trainers.trainername;

#How many pokemon have a secondary type Poison
select count(pokemons.name)
from pokemons
join types on types.id = pokemons.secondary_type
where types.name="Poison";

#What are all the primary types and how many pokemon have that type?
select types.name, count(pokemons.name)
from pokemons
join types on pokemons.primary_type = types.id
group by pokemons.primary_type;

#How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
SELECT COUNT(pokelevel) AS Pokemon_at_100Level
FROM pokemon_trainer
WHERE pokelevel = 100
GROUP BY trainerID;

#How many pokemon only belong to one trainer and no other?
SELECT SUM(total) FROM (SELECT COUNT(DISTINCT trainerID)
AS total FROM pokemon_trainer
GROUP BY pokemon_id
HAVING COUNT(*)=1)as x;