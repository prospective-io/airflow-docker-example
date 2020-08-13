from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime


def print_hello():
    return 'Hello world!'


dag = DAG('hello_world', description='Simple tutorial DAG', start_date=datetime(2020, 1, 1), schedule_interval=None)

hello_operator = PythonOperator(task_id='hello_task', python_callable=print_hello, dag=dag)
