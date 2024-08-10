all: up

up:
	sudo mkdir -p /home/mchiboub/data/mariadb /home/mchiboub/data/wordpress
	sudo docker compose -f ./srcs/docker-compose.yml up --build

down:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v

clean:
	sudo rm -rf /home/mchiboub/data

re: down clean all

ls:
	sudo docker image ls
	sudo docker ps
	sudo docker volume ls

prune:
	sudo docker system prune -fa --volumes

fclean: down clean prune

.PHONY: all down clean re ls prune
