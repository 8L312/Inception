NAME	= Inception

all:
	@printf "Lancement du docker ${NAME}\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@printf "Lancement du docker ${NAME}\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@printf "Arret du docker ${NAME}\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re:	down
	@printf "Reconstruction du docker ${NAME}\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@printf "Cleaning configuration ${NAME}...\n"
	@docker system prune -a
	@sudo rm -rf ~/data/

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/

.PHONY	: all build down re clean fclean
