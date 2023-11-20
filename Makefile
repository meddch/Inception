name = inception
all:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up 

build:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up  --build

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down -v

re: clean build

clean: down
	@docker system prune -a

fclean: clean
	# @docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	rm -rf /Users/mechane/Desktop/data/mariadb
	rm -rf /Users/mechane/Desktop/data/wordpress
	rm -rf /Users/mechane/Desktop/data/portainer
	rm -rf /Users/mechane/Desktop/data/

.PHONY	: all build down re clean fclean
