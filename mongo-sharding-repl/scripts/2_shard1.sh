#!/bin/bash

docker compose exec -T shard1_repl1 mongosh --port 27018 --quiet <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "shard1_repl1:27018" },
        { _id : 1, host : "shard1_repl2:27028" },
        { _id : 2, host : "shard1_repl3:27038" },

      ]
    }
);
exit();

EOF

