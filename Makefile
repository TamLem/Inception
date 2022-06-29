NAME = inception

url = tlemma.42.fr


$(NAME): 
	docker compose -f src/docker-compose.yml up --build

volume-dir:
	mkdir -p /home/${USER}/data
	mkdir -p /home/${USER}/data/db
	mkdir -p /home/${USER}/data/www

reload: 
	docker compose -f src/docker-compose.yml up 

host: 
	$(sudo echo "127.0.0.1 $url" >> /etc/hosts)

all: $(NAME)

clean: 
	docker compose -f src/docker-compose.yml down -v --rmi all --remove-orphans  
	# rm -rf /home/${USER}/data/*

