
This is a sample project showing how to run Apache Airflow inside a Docker container using the official image. 

While the setup here is intended for development and testing, this can be a starting point for using containerised 
Airflow in production as well. 

## Simple case: dev or test environment with the official Airflow image

### Initialisation (one time)
Run the `init_test_env.sh` script. This will create a directory called test_env with some sub-directories we
will later mount to the container, and also run the docker init-db command to create an empty metadata db. 

Once you see the `airflow-docker-example_initdb_1 exited with code 0` you can ctrl+c (but only ctrl+c once!). 

You can always `sudo rm -rf test_env` to start afresh. 

### Using 
Use `docker-compose up` to run Airflow. 

You should now be able to connect to the web-ui at http://localhost:8080 

To use the Airflow CLI, run bash inside the scheduler container:

    docker exec -it airflow-docker-example_scheduler_1 /bin/bash  


## Complex cases: build a custom image on top of the official Airflow image 

### Additional Python dependencies 

If you need Python packages / libraries that aren't shipped with Airflow, you will need to use a custom image. 
In this case: 

1. Put your requirements in `requirements.txt`. 
2. In the Dockerfile in this folder, uncomment these  two lines
    
       COPY requirements.txt /
       RUN pip3 install -r /requirements.txt --user 
 
3. Build the image `docker build --tag airflow-test .`. 
4. In docker-compose.yml, replace the `image: apache/airflow` lines with `image: airflow-test`

Every time you make change `requirements.txt`, you will have to re-build the container.    

