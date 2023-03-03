import tkinter as tk
from tkinter import font
from tkinter import *
import mysql.connector as mc
import config
from tkcalendar import DateEntry

def main():
    try: 
        # connection info
        usr = config.mysql['user']
        pwd = config.mysql['pass']
        hst = config.mysql['host']
        dab = 'ssovi_DB'
        # create a connection
        con = mc.connect(user=usr,password=pwd, host=hst, database=dab)
        rs = con.cursor()

    
        # create main window
        main_window=tk.Tk()
        main_window.title('ShopiPy')
                    
        main_window.configure(bg="navy")
        
        #use computer res for running
        width = main_window.winfo_screenwidth()               
        height = main_window.winfo_screenheight()
        main_window.geometry("%dx%d" % (width, height))

        myFont = font.Font(size=15)
        
        #method for leaving class/window which exits program
        def leave_classes():
            main_window.destroy()
        
        # initial row counter for window's grids
        row_count = 0
        row_count+=1

        # show item confirm for listing items
        def show_item_confirm():
            frame4 = tk.LabelFrame(main_window, bg="navy", fg = "navy", borderwidth = 0, highlightthickness = 0)

            def leave_confirm():
                frame4.destroy()
                row_count = 0
                show_main_page()
            
            row_count = 0
            row_count+=1

            label1 = tk.Label(frame4, text="Thanks", bg = "navy", fg = "white", font="none 50 bold")
            label1.grid(row = row_count, column = 1, pady = 100)

            row_count+=1


            label2 = tk.Label(frame4, text="Your product is now listed", bg = "navy", fg = "white", font="none 50 bold")
            label2.grid(row = row_count, column = 1, pady = 100)

            row_count+=1

            output = tk.Button(frame4, text = "Back", width = 25, height = 2, command = lambda:[leave_confirm()])
            output.grid(row = row_count, column = 1, padx = 10, pady = 10)

            frame4.pack(padx=10,pady=10)

        # show popularity of items
        def show_pop():
            frame4 = tk.LabelFrame(main_window, bg="navy", fg = "navy", borderwidth = 0, highlightthickness = 0)

            def leave_pop():
                frame4.destroy()
                row_count = 0
                show_view_page()
            
            row_count = 0
            row_count+=1

            label1 = tk.Label(frame4, text="Most Popular Items by Count", bg = "navy", fg = "white", font="none 50 bold")
            label1.grid(row = row_count, column = 1, pady = 20)

            row_count+=1

            rs = con.cursor()
            query = 'SELECT product_id, name, COUNT(*) count FROM product JOIN purchase USING(product_id) GROUP BY product_id ORDER BY COUNT(*) DESC LIMIT 5'
            rs.execute(query)

            prod_counter = 1

            for (product_id, name, count) in rs:
                    str = '{}) (product id: {}), product name: {}, number sold: {}'.format(prod_counter, product_id, name, count)
                    label2 = tk.Label(frame4, text=str, bg = "navy", fg = "white", font="none 20")
                    label2.grid(row = row_count, column = 1, pady = 5)
                    row_count+=1
                    prod_counter+=1
            
            prod_counter = 0
            row_count += 1

            label3 = tk.Label(frame4, text="Most Popular Items by Rating", bg = "navy", fg = "white", font="none 50 bold")
            label3.grid(row = row_count, column = 1, pady = 20)

            row_count += 1

            rs = con.cursor()
            query = 'SELECT product_id, name, AVG(star_rating) avg_r FROM product JOIN product_rating USING (product_id) GROUP BY product_id ORDER BY AVG(star_rating) DESC LIMIT 5'
            rs.execute(query)

            prod_counter = 1
            for (product_id, name, avg_r) in rs:
                    str = '{}) (product id: {}), product name: {}, average rating: {}'.format(prod_counter, product_id, name, avg_r)
                    label2 = tk.Label(frame4, text=str, bg = "navy", fg = "white", font="none 20")
                    label2.grid(row = row_count, column = 1, pady = 5)
                    row_count+=1
                    prod_counter+=1
            
            prod_counter = 0
            row_count += 1

            output = tk.Button(frame4, text = "Back", width = 25, height = 2, command = lambda:[leave_pop()])
            output.grid(row = row_count, column = 1, padx = 10, pady = 10)

            frame4.pack(padx=10,pady=10)

        # show stats of distributors
        def show_stats():
            frame4 = tk.LabelFrame(main_window, bg="navy", fg = "navy", borderwidth = 0, highlightthickness = 0)

            def leave_stats():
                frame4.destroy()
                row_count = 0
                show_view_page()
            
            row_count = 0
            row_count+=1

            label1 = tk.Label(frame4, text="Distributor Popularity by # Products Sold", bg = "navy", fg = "white", font="none 50 bold")
            label1.grid(row = row_count, column = 1, pady = 20)

            row_count+=1
            
            rs = con.cursor()
            query = 'SELECT distrib_id, distrib_name, COUNT(*) count FROM distributor JOIN purchase USING (distrib_id) GROUP BY distrib_id ORDER BY COUNT(*) DESC LIMIT 5'
            rs.execute(query)

            d_counter = 1

            for (distrib_id, distrib_name, count) in rs:
                    str = '{}) (distrib id: {}), distrib name: {}, items sold: {}'.format(d_counter, distrib_id, distrib_name, count)
                    label2 = tk.Label(frame4, text=str, bg = "navy", fg = "white", font="none 20")
                    label2.grid(row = row_count, column = 1, pady = 5)
                    row_count+=1
                    d_counter+=1
            
            d_counter = 0
            row_count += 1

            label3 = tk.Label(frame4, text="Most Popular Distributor by Rating", bg = "navy", fg = "white", font="none 50 bold")
            label3.grid(row = row_count, column = 1, pady = 20)

            row_count += 1

            rs = con.cursor()
            query = 'SELECT distrib_id, distrib_name, AVG(star_rating) avg_r FROM distributor JOIN distrib_rating USING (distrib_id) GROUP BY distrib_id ORDER BY AVG(star_rating) DESC LIMIT 5'
            rs.execute(query)

            d_counter = 1
            for (distrib_id, distrib_name, avg_r) in rs:
                    str = '{}) (distrib id: {}), distrib name: {}, average rating: {}'.format(d_counter, distrib_id, distrib_name, avg_r)
                    label2 = tk.Label(frame4, text=str, bg = "navy", fg = "white", font="none 20")
                    label2.grid(row = row_count, column = 1, pady = 5)
                    row_count+=1
                    d_counter+=1
            
            d_counter = 0
            row_count += 1

            output = tk.Button(frame4, text = "Back", width = 25, height = 2, command = lambda:[leave_stats()])
            output.grid(row = row_count, column = 1, padx = 10, pady = 10)

            frame4.pack(padx=10,pady=10)

        # show the page options under the view button
        def show_view_page():
            frame4 = tk.LabelFrame(main_window, bg="navy", fg = "navy", borderwidth = 0, highlightthickness = 0)

            def leave_view():
                frame4.destroy()
                row_count = 0
                show_main_page()
            
            def leave_to_avg():
                frame4.destroy()
                row_count = 0
                show_stats()
            
            def leave_to_pop():
                frame4.destroy()
                row_count = 0
                show_pop()

            row_count = 0
            row_count+=1

            label1 = tk.Label(frame4, text="Statistics", bg = "navy", fg = "white", font="none 50 bold")
            label1.grid(row = row_count, column = 1, pady = 100)

            row_count+=1

            boutput = tk.Button(frame4, text = "Distributor Popularity", width = 30, height = 5, command = lambda:[leave_to_avg()])
            boutput.grid(row = row_count, column = 0, padx = 40, pady = 40)
            boutput['font'] = myFont


            output = tk.Button(frame4, text = "Item Popularity", width = 30, height = 5, command = lambda:[leave_to_pop()])
            output['font'] = myFont
            output.grid(row = row_count, column = 2, padx = 40, pady = 40)

            row_count+=1

            output = tk.Button(frame4, text = "Back", width = 25, height = 2, command = lambda:[leave_view()])
            output.grid(row = row_count, column = 1, padx = 10, pady = 10)

            frame4.pack(padx=10,pady=10)

            
        # show the page for selling/listing an item
        def show_sell_page():
            frame4 = tk.LabelFrame(main_window, bg="navy", fg = "navy", borderwidth = 0, highlightthickness = 0)

            def leave_sell():
                frame4.destroy()
                row_count = 0
                show_main_page()
            
            def confirm_sell():
                #do query
                q = "SELECT * FROM product WHERE product_id = %s"
                rs.execute(q, (p_id.get(),))

                if rs.fetchone() == None: 
                    q = "INSERT INTO product VALUES (%s,%s,%s,%s,%s,%s)"
                    rs.execute(q, (p_id.get(), p_name.get(), desc.get(), "2022-12-13", distrib_id.get(), mfr_id.get()))

                else:
                    #update
                    q = "UPDATE product SET name = %s, distrib_id = %s, mfr_id = %s WHERE product_id = %s"
                    rs.execute(q, (p_name.get(), distrib_id.get(), mfr_id.get(), p_id.get()))

                frame4.destroy()
                row_count = 0
                show_item_confirm()

            row_count = 0
            row_count+=1

            label1 = tk.Label(frame4, text="What do you want to sell?", bg = "navy", fg = "white", font="none 50 bold")
            label1.grid(row = row_count, column = 1, pady = 100)

            row_count+=1

            p_name = StringVar()
            p_id = StringVar()
            desc = StringVar()
            distrib_id = StringVar()
            mfr_id = StringVar()


            boutput = tk.Entry(frame4, textvariable=p_name, width = 50, bg = "white")
            boutput.grid(row = row_count, column = 1, padx = 0, pady = 10)

            label2 = tk.Label(frame4, text="product name", bg = "navy", fg = "white", font="none 20 bold")
            label2.grid(row = row_count, column = 0, pady = 10, padx = 0)

            row_count+=1

            pid_output = tk.Entry(frame4, textvariable=p_id, width = 50, bg = "white")
            pid_output.grid(row = row_count, column = 1, padx = 0, pady = 10)

            label3 = tk.Label(frame4, text="product id", bg = "navy", fg = "white", font="none 20 bold")
            label3.grid(row = row_count, column = 0, pady = 10, padx = 0)

            row_count+=1

            desc_output = tk.Text(frame4, width = 50, height = 10)
            desc_output.grid(row = row_count, column = 1, padx = 0, pady = 10)

            label4 = tk.Label(frame4, text="description", bg = "navy", fg = "white", font="none 20 bold")
            label4.grid(row = row_count, column = 0, pady = 10, padx = 0)

            row_count+=1

            distrib_output = tk.Entry(frame4, textvariable=distrib_id, width = 50, bg = "white")
            distrib_output.grid(row = row_count, column = 1, padx = 0, pady = 10)

            label5 = tk.Label(frame4, text="distributor id", bg = "navy", fg = "white", font="none 20 bold")
            label5.grid(row = row_count, column = 0, pady = 10, padx = 0)

            row_count+=1

            mfid_output = tk.Entry(frame4, textvariable=mfr_id, width = 50, bg = "white")
            mfid_output.grid(row = row_count, column = 1, padx = 0, pady = 10)

            label6 = tk.Label(frame4, text="manufacturer id", bg = "navy", fg = "white", font="none 20 bold")
            label6.grid(row = row_count, column = 0, pady = 10, padx = 0)

            row_count+=1

            confirmation = tk.Button(frame4, text = "Confirm", width = 25, height = 2, command = lambda:[confirm_sell()])
            confirmation.grid(row = row_count, column = 1, padx = 10, pady = 10)

            output = tk.Button(frame4, text = "Back", width = 25, height = 2, command = lambda:[leave_sell()])
            output.grid(row = row_count, column = 2, padx = 10, pady = 10)

            frame4.pack(padx=10,pady=10)


        # show the results page (from searching)
        def show_results_page(str):
            frame4 = tk.LabelFrame(main_window, bg="navy", fg = "navy", borderwidth = 0, highlightthickness = 0)
            def leave_results():
                frame4.destroy()
                row_count = 0
                show_search_page()
            
            #"buy an item" using query
            def buy(prod_id):
                q = "SELECT distrib_id, mfr_id FROM product WHERE product_id = %s"
                rs.execute(q, (prod_id,))
                for (distrib_id, mfr_id) in rs:
                    d_id = distrib_id
                    m_id = mfr_id

                q = "INSERT INTO purchase (distrib_id, product_id, buyer_id) VALUES (%s, %s, 0)"
                rs.execute(q, (d_id, prod_id))
                
            #"rate an item" using query
            def rate(prod_id, num):

                q = "SELECT distrib_id, mfr_id FROM product WHERE product_id = %s"
                rs.execute(q, (prod_id,))
                for (distrib_id, mfr_id) in rs:
                    d_id = distrib_id
                    m_id = mfr_id

                q = "SELECT * FROM product_rating WHERE product_id = %s AND date = '2022-12-13'"
                rs.execute(q, (prod_id,))
                if rs.fetchone() == None:

                    q = "INSERT INTO product_rating VALUES (0, %s, '2022-12-13' ,%s)"
                    rs.execute(q, (prod_id, num))

                    q = "INSERT INTO distrib_rating VALUES (0, %s, '2022-12-13' ,%s)"
                    rs.execute(q, (d_id, num))
            
            row_count = 0
            row_count+=1
            
            rs = con.cursor()
            query = 'SELECT product_id, name, description, date_listed FROM product WHERE name = %s ORDER BY date_listed DESC LIMIT 10'
            rs.execute(query, (str,))

            prod_counter = 1

            for (product_id, name, description, date_listed) in rs:
                    str = '{}) (product id: {}), product name: {}: {}, listed on {}'.format(prod_counter, product_id, name, description, date_listed)
                    label2 = tk.Label(frame4, text=str, bg = "navy", fg = "white", font="none 20")
                    label2.grid(row = row_count, column = 1, pady = 5)
                    
                    buy_btn = tk.Button(frame4, text = "buy", width = 5, height = 1, command = lambda:[buy(product_id)]) #fill command later
                    buy_btn.grid(row = row_count, column = 2, padx = 10, pady = 10)

                    rate_btn = tk.Button(frame4, text = "rate 1", width = 5, height = 1, command = lambda:[rate(product_id, 1)]) #fill command later
                    rate_btn.grid(row = row_count, column = 3, padx = 3, pady = 10)

                    rate_btn = tk.Button(frame4, text = "rate 2", width = 5, height = 1, command = lambda:[rate(product_id, 2)]) #fill command later
                    rate_btn.grid(row = row_count, column = 4, padx = 3, pady = 10)

                    rate_btn = tk.Button(frame4, text = "rate 3", width = 5, height = 1, command = lambda:[rate(product_id, 3)]) #fill command later
                    rate_btn.grid(row = row_count, column = 5, padx = 3, pady = 10)

                    rate_btn = tk.Button(frame4, text = "rate 4", width = 5, height = 1, command = lambda:[rate(product_id, 4)]) #fill command later
                    rate_btn.grid(row = row_count, column = 6, padx = 3, pady = 10)

                    rate_btn = tk.Button(frame4, text = "rate 5", width = 5, height = 1, command = lambda:[rate(product_id, 5)]) #fill command later
                    rate_btn.grid(row = row_count, column = 7, padx = 3, pady = 10)

                    row_count+=1
                    prod_counter+=1
            
            prod_counter = 0
            

            row_count+=1

            output = tk.Button(frame4, text = "Back", width = 25, height = 2, command = lambda:[leave_results()])
            output.grid(row = row_count, column = 1, padx = 10, pady = 10)

            frame4.pack(padx=10,pady=10)

        # show the search page
        def show_search_page():
            frame4 = tk.LabelFrame(main_window, bg="navy", fg = "navy", borderwidth = 0, highlightthickness = 0)

            def leave_search():
                frame4.destroy()
                row_count = 0
                show_main_page()

            def leave_to_results(str):
                frame4.destroy()
                row_count = 0
                show_results_page(str)

            row_count = 0
            row_count+=1

            label1 = tk.Label(frame4, text="What do you want to buy?", bg = "navy", fg = "white", font="none 50 bold")
            label1.grid(row = row_count, column = 1, pady = 100)

            row_count+=1
            
            search_name = StringVar()

            boutput = tk.Entry(frame4, textvariable=search_name, width = 50, bg = "white")
            boutput.grid(row = row_count, column = 1, padx = 0, pady = 40)

            output = tk.Button(frame4, text = "search", width = 25, height = 2, command = lambda:[leave_to_results(search_name.get())])
            output.grid(row = row_count, column = 2, padx = 10, pady = 10)

            row_count+=1

            selected = StringVar()
            selected.set("Newest")

            values = ["Rating", "Newest", "Price"]

            drop = OptionMenu(frame4, selected, *values)
            drop.grid(row = row_count, column = 1)

            sort_by = tk.Label(frame4, text="sort by:", bg = "navy", fg = "white", font="none 20 bold")
            sort_by.grid(row = row_count, column = 0, pady = 40, padx = 0)

            row_count+=1

            output = tk.Button(frame4, text = "Back", width = 25, height = 2, command = lambda:[leave_search()])
            output.grid(row = row_count, column = 1, padx = 10, pady = 10)

            frame4.pack(padx=10,pady=10)
        
        # show the main page
        def show_main_page():
            frame4 = tk.LabelFrame(main_window, bg="navy", fg = "navy", borderwidth = 0, highlightthickness = 0)
            
            def wanna_buy():
                frame4.destroy()
                row_count = 0
                show_search_page()
            
            def wanna_sell():
                frame4.destroy()
                row_count = 0
                show_sell_page()
            
            def wanna_view():
                frame4.destroy()
                row_count = 0
                show_view_page()
                

            row_count = 0
            row_count+=1

            label1 = tk.Label(frame4, text="ShopiPy", bg = "navy", fg = "white", font="none 50 bold")
            label1.grid(row = row_count, column = 1, pady = 200)

            row_count+=1

            boutput = tk.Button(frame4, text = "I Wanna Buy!", width = 30, height = 5, command = lambda:[wanna_buy()])
            boutput.grid(row = row_count, column = 0, padx = 40, pady = 40)
            boutput['font'] = myFont

            coutput = tk.Button(frame4, text = "Stats", width = 30, height = 5, command = lambda:[wanna_view()])
            coutput['font'] = myFont
            coutput.grid(row = row_count, column = 1, padx = 40, pady = 40)

            output = tk.Button(frame4, text = "I Wanna Sell!", width = 30, height = 5, command = lambda:[wanna_sell()])
            output['font'] = myFont
            output.grid(row = row_count, column = 2, padx = 40, pady = 40)

            row_count+=1

            output = tk.Button(frame4, text = "Exit", width = 25, height = 2, command = lambda:[leave_classes()])
            output.grid(row = row_count, column = 1, padx = 10, pady = 10)

            frame4.pack(padx=10,pady=10)

        show_main_page()
        main_window.mainloop()
    except mc.Error as err:
        print(err) # catch exceptions

    finally:
        rs.close() # close results set
        con.close() # close connection


if __name__ == '__main__':
    main()