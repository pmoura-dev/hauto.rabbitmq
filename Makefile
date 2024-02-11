IMAGENAME=hauto.rabbitmq
CONTAINERNAME=hauto.rabbitmq
PORT=5672
MQTTPORT=1883
MANAGEMENTPORT=15672

.PHONY: build run exec stop clean all

build:
	@docker build -t ${IMAGENAME} .

run:
	@docker run -d --network hauto-network --name ${CONTAINERNAME} -p ${PORT}:${PORT} -p ${MANAGEMENTPORT}:${MANAGEMENTPORT} -p ${MQTTPORT}:${MQTTPORT} ${IMAGENAME}

exec:
	@docker exec -it ${CONTAINERNAME} sh

stop:
	@docker stop ${CONTAINERNAME}

clean:
	@docker rm ${CONTAINERNAME}
	@docker rmi ${IMAGENAME}
