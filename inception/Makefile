all:
	@sh ./srcs/requirements/tools/create.sh "creat"
	@docker-compose -f srcs/docker-compose.yml up -d

clean:
	@docker-compose -f srcs/docker-compose.yml down


fclean:
	@docker system prune -a -f
	@docker-compose -f srcs/docker-compose.yml down -v --rmi all 
	@chmod 777 /home/hassimi/data
	@sudo sh ./srcs/requirements/tools/create.sh "delete"

re : clean all