all : up

up :
	@mkdir -p /home/asabbar/data/wp_files
	@mkdir -p /home/asabbar/data/db_files
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@docker-compose -f ./srcs/docker-compose.yml down -v 
	@docker system prune --all --force --volumes

status : 
	@docker ps
