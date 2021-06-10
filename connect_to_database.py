import pyodbc
import pandas
#"ASPIREE15"

def connect_database(server, database):
    connect = pyodbc.connect('Driver={SQL Server};'
                      'Server=' + server +';'
                      'Database=' + database +';'
                      'Trusted_Connection=yes;')
    print("-----------------------------------------------------")
    print("successfully connected to", database, "database")
    print("-----------------------------------------------------")
    return connect

# this function for execute sql query like " create table <table name> ", " alter table <table name>"
def execute_query(connection, query):
    cursor =connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print('query successful')
    except EOFError as err:
        print(f" Error: '{err}'")

# this function for execute sql query like " Insert into (column) values ('values row 1' , 'values row 2') "
def execute_list_query(connection, sql, values):
    cursor = connection.cursor()
    try:
        cursor.executemany(sql, values)
        connection.commit()
        print("Query successful")

    except EOFError as err:
        print(f"Error: '{err}'")

# this function for read values from tables ---> " select * from < table name > "

def read_query(connection, query):
    cursor = connection.cursor()
    row = None
    try:
        cursor.execute(query)
        row = cursor.fetchall()
        return row

    except EOFError as err:
        print(f" Error: '{err}'")

# this function for print the values like TABLE FORM after get the values from 'read_query' function
def print_table_form(results, column):
    from_db = []
    for result in results:
        result = list(result)
        from_db.append(result)

    df = pandas.DataFrame(from_db, columns=column)
    print(df)

def choice():
    server = input("Enter server : ")
    database = input("Enter database : ")

    print("--- If You Want input data to table enter '1' ---")
    print("--- If You Want delete data from table enter '2' ---")
    print("--- If You Want read data from table enter '3' ---")
    print("--- If You Want create table enter '4' ---")

    selected_val = int(input("Enter what you want to do :"))
    print("Please wait...")
    return server, database, selected_val

def create_table():
    table_name = input("Enter Table Name :")
    no = int(input("Enter Number Of column :"))
    col = []
    x=0
    while True:
        c = input("Enter Column Name & type :")
        col.append(c)
        x +=1
        if x == no:
            break

    return table_name, col

def input_data():

    id_no = input("Enter Student Id :")
    f_name = input("Enter student first name :")
    l_name = input("Enter Student last name :")
    dob = input("Enter Student Birth day :")
    gender = input("Enter student Gender [Male: M / Female: F] :")
    contact = input("Enter student contact :")
    grade = input("Enter student grade :")
    address = input("Enter Student Address :")

    val = (id_no, f_name, l_name, dob, gender, contact, grade, address)

    return val

server, database, selected_val = choice()
connect = connect_database(server, database)

if selected_val == 1:
    t_name = input("Enter Table Name : ")
    val = input_data()
    add = "insert into "+ t_name +" values " + str(val)
    execute_query(connect, add)

    print("Query successful")

elif selected_val == 2:
    t_name = input("Enter Table Name : ")
    row_id = input("Enter which id is want to delete : ")
    delete_row = "delete from "+ t_name +" where  sid =" + "'"+row_id+"'"
    execute_query(connect, delete_row)


elif selected_val == 3:
    t_name = input("Enter Table Name : ")
    select_table ="select * from "+ str(t_name)
    results = read_query(connect, select_table)
    column = ['Sid', 'fname', 'lname', 'DOB', 'Gender', 'Contact', 'Grade', 'address']
    print_table_form(results, column)

else:
    print("Error : Enter wrong number !!!")


#insert = '''insert into student (sid, fname, lname, DOB, gender, contact, grade, address) values (%s , %s, %s, %s, %s, %s, %s, %s)'''
# val = [('1000', 'chamal', 'ruwanjith', '1996/05/24', 'M', '0768791391', '12', 'piliyandala'),
#        ('1004', 'kamal', 'korala', '1996/05/25', 'M', '0768712559', '11', 'moratuwa')
#        ]

