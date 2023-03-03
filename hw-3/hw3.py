#######################################
##NAME: Samuel Sovi
# CLASS: CPSC 321 Section 1
# DATE: 10/12/22
# HOMEWORK: hw3
# DESCRIPTION: Implementing queries using python and 
# updating/modifying tables with user inputs
######################################

import mysql.connector as mc
import config

def main():
    try: 
        # connection info
        usr = config.mysql['user']
        pwd = config.mysql['pass']
        hst = config.mysql['host']
        dab = 'ssovi_DB'
        # create a connection
        con = mc.connect(user=usr,password=pwd, host=hst, database=dab)
        user_input_1 = 0
        rs = con.cursor()
        #rs.reset()
        while user_input_1 != 5:
            #list the user's options
            print("")
            print("1. List countries")
            print("2. Add country")
            print("3. Find countries based on gdp and inflation")
            print("4. Update country's gdp and inflation")
            print("5. Exit")
            user_input_1 = int(input('Enter you choice (1-5):'))
            print("")
            # if user selects 1:
            if user_input_1 == 1:
                # create a result set
                rs = con.cursor()
                query = 'SELECT * FROM country'
                # execute the query
                rs.execute(query)
                # pretty print the query results:
                for (country_code, country_name, gdp, inflation) in rs:
                    print('{} ({}), per capita gdp ${}, inflation rate {}%'.format(country_name, country_code, gdp, inflation))
            # if user selects 2:
            elif user_input_1 == 2:
                # get user inputs
                user_input_code = input("Country code................: ")
                user_input_name = input("Country name................: ")
                user_input_gdp = input("Country per capita gdp (USD): ")
                user_input_inflation = input("Country inflation (pct).....: ")
                # check if valid input (country code does not already exist)
                # if not, add country to database
                # otherwise, notify that country already exists

                # find if country code exists:
                q = "SELECT * FROM country WHERE country_code = %s"
                rs.execute(q, (user_input_code,))
                if rs.fetchone() == None: 
                    print("")
                    # inserting query:
                    q = "INSERT INTO country VALUES (%s,%s,%s,%s)"
                    rs.execute(q, (user_input_code, user_input_name, user_input_gdp, user_input_inflation))
                    # commit the changes to the DB
                    con.commit()
                else:
                    print("")
                    print("Country with same country code already exists...")
            # if user enters 3  
            elif user_input_1 == 3:
                # get user inputs
                user_input_min_gdp = input("Minimum per capita gdp (USD)..: ")
                user_input_max_gdp = input("Maximum per capita gdp (USD)..: ")
                user_input_min_inflation = input("Minimum inflation (pct).......: ")
                user_input_max_inflation = input("Maximum inflation (pct).......: ")
                # find all within search parameters
                q = "SELECT * FROM country WHERE gdp > %s AND gdp < %s AND inflation > %s AND inflation < %s ORDER BY gdp DESC, inflation ASC"
                rs.execute(q, (user_input_min_gdp, user_input_max_gdp, user_input_min_inflation, user_input_max_inflation))
                print("")
                # pretty print the query results:
                for (country_code, country_name, gdp, inflation) in rs:
                    print('{} ({}), per capita gdp ${}, inflation rate {}%'.format(country_name, country_code, gdp, inflation))
                print("")
            # if user enters 4:
            elif user_input_1 == 4:
                # get user inputs:
                user_input_code = input("Country code................: ")
                user_input_gdp = input("Country per capita gdp (USD): ")
                user_input_inflation = input("Country inflation (pct).....: ")

                # find if country code exists
                q = "SELECT * FROM country WHERE country_code = %s"
                #rs = cn.cursor()
                rs.execute(q, (user_input_code,))
                if rs.fetchone() == None: 
                    print("")
                    print("Country with given country code does not exist...")
                    
                else:
                    # query for updating the selected country with new gdp and inflation
                    q = "UPDATE country SET gdp = %s, inflation = %s WHERE country_code = %s"
                    rs.execute(q, (user_input_gdp, user_input_inflation, user_input_code))
                    # commit the changes to the DB
                    con.commit()
            else:
                # for any other input, leave
                user_input = 5
        
        print("Bye!")
        
    except mc.Error as err:
        print(err)

    finally:
        rs.close()
        con.close()

if __name__ == '__main__':
    main()