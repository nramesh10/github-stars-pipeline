import os 
import gzip 
import json 
import duckdb

sample_data = 'data/gharchive_sample'
json_gz_files = [f for f in os.listdir(sample_data) if f.endswith('.json.gz')]

unzipped_dir = os.path.join(sample_data, 'unzipped')
os.makedirs(unzipped_dir, exist_ok= True)

def unzip_json_file(src_gz_path, dest_json_dir):
    base_name = os.path.basename(src_gz_path)
    json_file_name = base_name [:-3] 
    dest_json_path = os.path.join(dest_json_dir, json_file_name)

    with gzip.open(src_gz_path, 'rt', encoding= 'utf-8') as gz_file: 
        with open(dest_json_path, 'w', encoding= 'utf-8') as json_file: 
            json_file.write(gz_file.read())

for gz_file in json_gz_files:
    src_gz_path = os.path.join(sample_data, gz_file)
    unzip_json_file(src_gz_path, unzipped_dir)

db_path = os.path.join(sample_data, 'my_database.duckdb')
con = duckdb.connect(database = db_path, read_only = False)

con.execute("CREATE SCHEMA IF NOT EXISTS source")

create_table_query = """
CREATE OR REPLACE TABLE source.src_gharchive AS 
SELECT * FROM read_json_auto('{}/*.json')
""".format(unzipped_dir)
con.execute(create_table_query)

con.close()





