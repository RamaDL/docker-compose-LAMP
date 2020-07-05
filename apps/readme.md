#  APP COMPOSE
De estos composes puede haber más de uno en cada server.
Por eso es importante que no tengan ports que se repitan
En realidad alcanza con el expose y que el proxy se haga cargo.

```
 NETWORK                SERVICES             VOLUMES

+-------+           +----------------+   +------------+
| proxy +-----------+  WEB           +<--+ nginx.conf |
+-------+           |                |   +------------+
    +---------------+  nginx:latest  +<---------+
    |               +----------------+          |ReadOnly
    |                                       +-------+
    |                                       |  app  |
    |           +----------------------+    +---+-+-+
    |           | CRON                 |        | |
    |    +------+                      +<-------+ |
    |    |      | kafe/appname:Version |          |
    |    |      +----------------------+          |
    |    |                                        |
    |    |      +----------------------+          |
+---+----+-+    | PHP                  |          |
| default  +----+                      +<---------+
+----+-----+    | kafe/appname:Version |
     |          +----------------------+
     |                                      persistent
     |            +-----------------+          +
     |            | DB              |       +--v--+
     +------------+                 +-------+ db  |
                  | mariadb:10.3.17 |       +-----+
                  +-----------------+
```
