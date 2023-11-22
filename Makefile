name = inception
all:
	@echo "Starting $(name)..."
	@mkdir -p /home/mechane/data && \
    mkdir -p /home/mechane/data/mariadb && \
    mkdir -p /home/mechane/data/wordpress && \
    mkdir -p /home/mechane/data/portainer
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up 

build:
	@echo "Building $(name)..."
	@mkdir -p /home/mechane/data && \
    mkdir -p /home/mechane/data/mariadb && \
    mkdir -p /home/mechane/data/wordpress && \
    mkdir -p /home/mechane/data/portainer
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@echo "Stopping $(name)..."
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down -v

re: clean build

clean: down
	@echo "Cleaning $(name)..."
	@docker system prune -a

fclean: clean
	@echo "Force cleaning $(name)..."
	@echo "Removing all containers..."
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	rm -rf /home/mechane/data/mariadb
	rm -rf /home/mechane/data/wordpress
	rm -rf /home/mechane/data/portainer
	rm -rf /home/mechane/data/

.PHONY	: all build down re clean fclean
