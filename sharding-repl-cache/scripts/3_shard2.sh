
#!/bin/bash

docker compose exec -T shard2_repl1 mongosh --port 27019 --quiet <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
       { _id : 0, host : "shard2_repl1:27019" },
       { _id : 1, host : "shard2_repl2:27029" },
       { _id : 2, host : "shard2_repl3:27039" }
      ]
    }
  );
exit(); 

EOF



