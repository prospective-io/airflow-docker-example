FROM apache/airflow

# Uncomment these two lines if you need to install Python packages that aren't shipped with Airflow
COPY requirements.txt /
RUN pip3 install -r /requirements.txt --user

