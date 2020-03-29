#What is each pokemons primary type?
select pokemons.name, types.name
from pokemons
join types on pokemons.primary_type = types.id;

#What is Rufflet's secondary type?
select pokemons.name, types.name as "Secondary Type"
from pokemons
join types on pokemons.secondary_type = types.id
where pokemons.name = 'Rufflet';

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
select count(pokelevel) as Pokemon_at_100Level
from pokemon_trainer
where pokelevel = 100
group by trainerID;

#How many pokemon only belong to one trainer and no other?
select sum(total) from (select count(distinct trainerID)
as total from pokemon_trainer
group by pokemon_id
having count(*)=1)as x;