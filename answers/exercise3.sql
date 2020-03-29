#Directions: Write a query that returns the following collumns:

#Pokemon Name	Trainer Name	Level	Primary Type	Secondary Type
#okemon's name	Trainer's name	Current Level	Primary Type Name	Secondary Type Name

select p.name as 'Pokemon Name', t.trainername as 'Trainer Name',
       pt.pokelevel as 'Level', p.primary_type as 'Primary Type',
       p.secondary_type as 'Secondary Type',
       (pt.speed + pt.spdef + pt.spatk + pt.defense + pt.attack + pt.hp)
           as 'Top Stat Total' from pokemons as p join pokemon_trainer
    as pt on pt.trainerID= p.id join trainers as t on pt.trainerID = t.trainerID
order by 'Top Stat Total' desc , pt.pokelevel desc;

#Ordered by Level which is pokelevel
# Then by Top Stat Total which is total of speed, spdef, apatk, defense, attack and hp.