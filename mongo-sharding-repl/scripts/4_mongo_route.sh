docker compose exec -T mongos_router mongosh --port 27020 <<EOF

sh.addShard( "shard1/shard1_repl1:27018");
sh.addShard( "shard2/shard2_repl1:27019");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )

use somedb

for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})

db.helloDoc.countDocuments() 
exit(); 
EOF