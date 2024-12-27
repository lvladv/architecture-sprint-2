docker compose exec -T shard1_repl1 mongosh --port 27018 <<EOF
 use somedb;
 db.helloDoc.countDocuments();
 exit(); 

EOF

docker compose exec -T shard2_repl1 mongosh --port 27019 << EOF
use somedb;
db.helloDoc.countDocuments();
exit(); 
EOF