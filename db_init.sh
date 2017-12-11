#!/bin/sh
docker run --net=c3bos_default -v /home/felix/docs/ccc/c3bos:/app c3bos_c3bos rake db:migrate
