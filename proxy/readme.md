#  PROXY COMPOSE

Todos usan un proxy con letsencrypt.
Usemos el que usan todos con minimas modificaciones.

Es cada server tiene que haber una instancia de este proxy y pueden
haber varias de apps usando distintos virtualhosts

```
+----------+
| INTERNET |               SERVICES                      VOLUMES
+--+-------+                                             & MOUNTS
   |         +------------------------------------+  +-------------+
   |     +-----+            PROXY                 +--+ custom.conf |
   +-----+  80 +<-PORTS                           |  +-------------+
         | 443 |                                  +---------+
         +-----+       jwilder                    |         |
     +-------+         /nginx+proxy:alpine        |  +------+------+
     |       +------------------------------------+  | CERTS       |
     |                                               | VHOST.D     |
     |       +------------------------------------+  | HTML        |
+----+-----+ |             LETSENCRYPT            |  | Docker.sock |
| proxynet +-+ jrcs                               |  +------+------+
+----+-----+ | /letsencrypt-nginx-proxy-companion |         |
     |       +----------------------------------+--         |
     |                                          |           |
     |                                          +-----------+
     |        +--------------------+
     +-expose-+    WEB SERVICE     |
     |        | FROM OTHER COMPOSE |
     |        +--------------------+
     |
     |        +--------------------+
     +-expose-+    WEB SERVICE     |
              | FROM OTHER COMPOSE |
              +--------------------+
```
