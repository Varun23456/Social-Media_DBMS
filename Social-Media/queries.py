from datetime import datetime
import pymysql as p

def get_users_by_gender():
    try:
        print("Enter gender (e.g., 'Male', 'Female', 'Other'): ")
        gender = input().strip()
        command = "SELECT * FROM USER WHERE gender = %s;"
        cur.execute(command, (gender,))
        users = cur.fetchall()
        if users:
            for user in users:
                user_id = user[0]
                email_id = user[1]
                username = user[2]
                birthdate = user[3].strftime("%Y-%m-%d") if user[3] else "No Birthdate"
                gender = user[4]
                firstname = user[5]
                middlename = user[6] if user[6] else "No Middle Name"
                lastname = user[7]
                created_at = user[8].strftime("%Y-%m-%d %H:%M:%S") if user[8] else "No Date"
                print(f"User ID: {user_id}")
                print(f"Email ID: {email_id}")
                print(f"Username: {username}")
                print(f"First Name: {firstname}")
                print(f"Middle Name: {middlename}")
                print(f"Last Name: {lastname}")
                print(f"Birthdate: {birthdate}")
                print(f"Gender: {gender}")
                print(f"Created At: {created_at}")
                print("-" * 40) 
        else:
            print("No users found with gender:", gender)
    except ValueError:
        print("Invalid input. Please enter a valid gender.")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)

def get_posts_by_user():
    try:
        print("Enter the user id:")
        user_id = int(input())
        command = "SELECT * FROM POST WHERE posted_user_id = %s;"
        cur.execute(command, (user_id,))
        posts = cur.fetchall()
        if posts:
            for post in posts:
                post_id = post[0]
                content = post[1]
                visibility = post[2]
                created_at = post[3].strftime("%Y-%m-%d %H:%M:%S") if post[3] else "No Date"
                updated_at = post[4].strftime("%Y-%m-%d %H:%M:%S") if post[4] else "No Date"
                posted_user_id = post[5]
                print(f"Post ID: {post_id}")
                print(f"Content: {content}")
                print(f"Visibility: {visibility}")
                print(f"Created At: {created_at}")
                print(f"Updated At: {updated_at}")
                print(f"Posted By User ID: {posted_user_id}")
                print("-" * 40)
        else:
            print("No posts found for user ID:", user_id)
    except ValueError:
        print("Invalid input. Please enter a valid user ID.")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def get_messages_between_users():
    try:
        print("Enter User ID 1:")
        user_id_1 = int(input())
        print("Enter User ID 2:")
        user_id_2 = int(input())
        command = """
        SELECT 
            m.message_id,
            m.Text,
            m.Sender_id,
            m.Receiver_id,
            MAX(ms.sented) AS sent_time,
            MAX(me.seenAt) AS seen_time
        FROM MESSAGE m
        LEFT JOIN MESSAGE_SENT ms ON m.message_id = ms.message_id
        LEFT JOIN MESSAGE_SEEN me ON m.message_id = me.message_id
        WHERE (m.Sender_id = %s AND m.Receiver_id = %s) OR (m.Sender_id = %s AND m.Receiver_id = %s)
        GROUP BY m.message_id;
        """
        cur.execute(command, (user_id_1, user_id_2, user_id_2, user_id_1))
        messages = cur.fetchall()
        if messages:
            for message in messages:
                message_id = message[0]
                text = message[1]
                sender_id = message[2]
                receiver_id = message[3]
                sent_time = message[4].strftime("%Y-%m-%d %H:%M:%S") if message[4] else "Not Sent"
                seen_time = message[5].strftime("%Y-%m-%d %H:%M:%S") if message[5] else "Not Seen"
                print(f"Message ID: {message_id}")
                print(f"Text: {text}")
                print(f"Sender ID: {sender_id}")
                print(f"Receiver ID: {receiver_id}")
                print(f"Sent Time: {sent_time}")
                print(f"Seen Time: {seen_time}")
                print("-" * 40)
        else:
            print("No messages found between User ID:", user_id_1, "and User ID:", user_id_2)
            
    except ValueError:
        print("Invalid input. Please enter valid user IDs.")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)

def get_usernames_by_age():
    try:
        age=input("Enter the age: ")
        current_date = datetime.now()
        command = """
        SELECT username, birthdate 
        FROM USER 
        WHERE (YEAR(%s) - YEAR(birthdate)) > %s OR 
              ((YEAR(%s) - YEAR(birthdate)) = %s AND MONTH(%s) > MONTH(birthdate)) OR 
              ((YEAR(%s) - YEAR(birthdate)) = %s AND MONTH(%s) = MONTH(birthdate) AND DAY(%s) >= DAY(birthdate));
        """
        cur.execute(command, (current_date,age, current_date, age,current_date, current_date,age, current_date, current_date))
        users = cur.fetchall()
        if users:
            print("Users older than %s:"%(age))
            for user in users:
                username = user[0]
                print(username)
        else:
            print("No users found older than 18.")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def get_content_of_posts_by_visibility():
    try:
        visibilit=input("Enter visibility type: ")
        command = """
        SELECT post_id, text, created_at, modified_at, posted_user_id 
        FROM POST 
        WHERE visibility = '%s';
        """%(visibilit)
        cur.execute(command)
        posts = cur.fetchall()
        if posts:  
            print("Public Posts:")
            for post in posts:
                post_id = post[0]
                text = post[1]
                created_at = post[2].strftime("%Y-%m-%d %H:%M:%S") if post[2] else "No Date"
                modified_at = post[3].strftime("%Y-%m-%d %H:%M:%S") if post[3] else "No Date"
                posted_user_id = post[4]
                print(f"Post ID: {post_id}")
                print(f"Content: {text}")
                print(f"Created At: {created_at}")
                print(f"Modified At: {modified_at}")
                print(f"Posted By User ID: {posted_user_id}")
                print("-" * 40)
        else:
            print("No public posts found.")
            
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def get_reply_ids_of_user():
    try:
        user_id = int(input("Enter User ID: "))
        command = "SELECT reply_id FROM REPLY WHERE user_id = %s;"
        cur.execute(command, (user_id,))
        replies = cur.fetchall()
        if replies:
            print("Reply IDs:")
            for reply in replies:
                print(reply[0])
        else:
            print("No replies found for User ID:", user_id)
    except ValueError:
        print("Invalid input. Please enter a valid user ID.")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def count_comments_by_userid():
    try:
        user_id = int(input("Enter User ID: "))
        command = "SELECT COUNT(*) FROM COMMENT WHERE Commented_user_id = %s;"
        cur.execute(command, (user_id,))
        count = cur.fetchone()[0]
        print(f"User ID {user_id} has made {count} comments.")
    except ValueError:
        print("Invalid input. Please enter a valid user ID.")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def average_followers_for_pages():
    try:
        command_followers = "SELECT COUNT(user_id) FROM PAGE_FOLLOWS;"
        cur.execute(command_followers)
        total_followers = cur.fetchone()[0] or 0
        command_pages = "SELECT COUNT(*) FROM PAGE;"
        cur.execute(command_pages)
        total_pages = cur.fetchone()[0] or 1
        average_followers = total_followers / total_pages
        print(f"Average number of followers across all pages: {average_followers:.2f}")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def search_groupname_by_word():
    try:
        keyword = input("Enter a word to search for in group names: ")
        search_pattern = f'%{keyword}%'
        command = "SELECT group_name FROM `GROUP` WHERE group_name LIKE %s;"
        cur.execute(command, (search_pattern,))
        results = cur.fetchall()
        if results:
            print("Groups containing '{}':".format(keyword))
            for row in results:
                print(row[0])
        else:
            print("No groups found containing '{}'.".format(keyword))
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)

def search_event_by_word():
    try:
        keyword = input("Enter a word to search for in event names: ")
        search_pattern = f'%{keyword}%'
        command = "SELECT event_name FROM EVENT WHERE event_name LIKE %s;"
        cur.execute(command, (search_pattern,))
        results = cur.fetchall()
        if results:
            print("Events containing '{}':".format(keyword))
            for row in results:
                print(row[0])
        else:
            print("No events found containing '{}'.".format(keyword))
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def update_post_visibility():
    try:
        post_id = int(input("Enter the post id: "))
        new_visibility = input("Enter new visibility: ")
        command = "UPDATE POST SET visibility = %s WHERE post_id = %s;"
        cur.execute(command, (new_visibility, post_id))
        if cur.rowcount == 0:
            print("No post found with post_id = {}.".format(post_id))
        else:
            print("Post visibility updated successfully.")
        con.commit()
    except ValueError:
        print("Invalid input. Please enter a valid post ID.")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def update_user_phone_number():
    try:
        user_id = int(input("Enter user ID: "))
        old_phone_number = input("Enter old phone number: ")
        new_phone_number = input("Enter new phone number: ")
        command = "UPDATE USER_PHONE_NUMBER SET phone_number = %s WHERE user_id = %s AND phone_number = %s;"
        cur.execute(command, (new_phone_number, user_id, old_phone_number))
        if cur.rowcount == 0:
            print("No user found with user_id = {} or the old phone number does not match.".format(user_id))
        else:
            print("User phone number updated successfully.")
        con.commit()
    except ValueError:
        print("Invalid input. Please enter a valid user ID.")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def update_event_time():
    try:
        event_id=input("Enter the event id: ")
        new_start_time=input("Enter the new start time: ")
        new_end_time=input("Enter when the event ends: ")
        command="UPDATE EVENT SET start_time='%s', end_time='%s' WHERE event_id=%s"%(new_start_time,new_end_time,event_id)
        cur.execute(command)
        con.commit()
        print("Time updated")
    except ValueError:
        print("Invalid input. Please enter a valid user ID.")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def delete_group_by_name():
    try:
        group_name = input("Enter the group name to delete: ")
        delete_members_command = """
        DELETE FROM GROUP_MEMBERS 
        WHERE group_id IN (SELECT group_id FROM `GROUP` WHERE group_name = %s);
        """
        cur.execute(delete_members_command, (group_name,))
        delete_group_command = "DELETE FROM `GROUP` WHERE group_name = %s;"
        cur.execute(delete_group_command, (group_name,))
        
        if cur.rowcount == 0:
            print("No groups found with the name '{}'.".format(group_name))
        else:
            print("Groups with the name '{}' deleted successfully.".format(group_name))
        con.commit()
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def delete_media_links():
    try:
        post_id=input("Enter the post id:")
        command = "DELETE FROM MEDIA_LINKS WHERE Post_id = %s;"
        cur.execute(command, (post_id,))
        if cur.rowcount == 0:
            print("No media links found for post_id = {}.".format(post_id))
        else:
            print("Media links for post_id = {} deleted successfully.".format(post_id))
        con.commit()
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
    
def insert_user():
    try:
        command="SELECT COUNT(*) FROM USER;"
        cur.execute(command)
        l=cur.fetchall()
        user_id=l[0][0]+1
        email_id = input("Enter email ID: ")
        if not email_id or email_id.strip().upper() == 'NULL':
            raise ValueError("Email ID cannot be NULL or empty.")
        username = input("Enter username: ")
        if not username or username.strip().upper() == 'NULL':
            raise ValueError("Username cannot be NULL or empty.")
        birthdate = input("Enter birthdate (YYYY-MM-DD): ")
        if birthdate.strip().upper() == 'NULL' or not birthdate:
            birthdate = None 
        gender = input("Enter gender (Male/Female/Other): ")
        firstname = input("Enter first name: ")
        middlename = input("Enter middle name: ")
        if middlename.strip().upper() == 'NULL' or not middlename:
            middlename = None 
        lastname = input("Enter last name: ")
        command="SELECT * FROM USER WHERE email_id='%s';"%(email_id)
        cur.execute(command)
        l=cur.fetchall()
        if len(l) > 0:
            print("Email id already in use")
            return
        command="SELECT * FROM USER WHERE username='%s';"%(username)
        cur.execute(command)
        l=cur.fetchall()
        if len(l) > 0:
            print("username already in use")
            return
        command = """
        INSERT INTO USER (user_id, email_id, username, birthdate, gender, firstname, middlename, lastname)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s);
        """
        cur.execute(command, (user_id, email_id, username, birthdate, gender, firstname, middlename, lastname))
        print("User inserted successfully.")
        con.commit()
    except ValueError as ve:
        print("Error:", ve)
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
    
def add_reaction():
    try:
        user_id = int(input("Enter your user ID: "))
        reaction_type = input("Enter the reaction type (e.g., Like, Love, Haha): ")
        choice = input("Add reaction to (post/comment/reply): ").strip().lower()        
        if choice == 'post':
            post_id = int(input("Enter post ID: "))
            command = """
            INSERT INTO REACTS_TO_POST (user_id, post_id, reaction_type)
            VALUES (%s, %s, %s);
            """
            cur.execute(command, (user_id, post_id, reaction_type))
            print("Reaction added to post successfully.")
            con.commit()
        elif choice == 'comment':
            comment_id = int(input("Enter comment ID: "))
            command = """
            INSERT INTO REACTS_TO_COMMENT (user_id, comment_id, reaction_type)
            VALUES (%s, %s, %s);
            """
            cur.execute(command, (user_id, comment_id, reaction_type))
            print("Reaction added to comment successfully.")
            con.commit()
        elif choice == 'reply':
            reply_id = int(input("Enter reply ID: "))
            command = """
            INSERT INTO REACTS_TO_REPLY (user_id, reply_id, reaction_type)
            VALUES (%s, %s, %s);
            """
            cur.execute(command, (user_id, reply_id, reaction_type))
            print("Reaction added to reply successfully.")
            con.commit()
        else:
            print("Invalid choice. Please select either 'post', 'comment', or 'reply'.")
    except ValueError as ve:
        print("Error: Invalid input. Please enter valid IDs and types.")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def analyze_average_comments_per_post():
    try:
        query = """
        SELECT u.gender,
               COUNT(c.comment_id) AS total_comments,
               COUNT(DISTINCT p.post_id) AS total_posts,
               CASE 
                   WHEN COUNT(DISTINCT p.post_id) > 0 THEN 
                       COUNT(c.comment_id) / COUNT(DISTINCT p.post_id)
                   ELSE 
                       0
               END AS average_comments_per_post
        FROM USER u
        LEFT JOIN POST p ON u.user_id = p.posted_user_id
        LEFT JOIN COMMENT c ON p.post_id = c.Commented_post_id
        GROUP BY u.gender;
        """
        cur.execute(query)
        results = cur.fetchall()
        print(f"{'Gender':<10} {'Total Comments':<15} {'Total Posts':<15} {'Avg Comments/Post':<20}")
        print("-" * 60)
        for row in results:
            gender, total_comments, total_posts, avg_comments_per_post = row
            print(f"{gender:<10} {total_comments:<15} {total_posts:<15} {avg_comments_per_post:<20.2f}")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def analyze_user_age_distribution():
    try:
        query = """
        SELECT g.group_name,
               MIN(TIMESTAMPDIFF(YEAR, u.birthdate, CURDATE())) AS min_age,
               MAX(TIMESTAMPDIFF(YEAR, u.birthdate, CURDATE())) AS max_age
        FROM `GROUP` g
        JOIN GROUP_MEMBERS gm ON g.group_id = gm.group_id
        JOIN USER u ON gm.user_id = u.user_id
        GROUP BY g.group_name;
        """
        cur.execute(query)
        results = cur.fetchall()
        print(f"{'Group Name':<40} {'Min Age':<10} {'Max Age':<10}")
        print("-" * 60)
        for row in results:
            group_name, min_age, max_age = row
            print(f"{group_name:<40} {min_age:<10} {max_age:<10}")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)
        
def analyze_average_response_time():
    try:
        query = """
        SELECT u.gender,
        AVG(TIMESTAMPDIFF(SECOND, ms.sented, msn.seenAt)) AS average_response_time
        FROM MESSAGE m
        JOIN MESSAGE_SENT ms ON m.message_id = ms.message_id
        JOIN MESSAGE_SEEN msn ON m.message_id = msn.message_id
        JOIN USER u ON m.Receiver_id = u.user_id
        WHERE ms.sented IS NOT NULL AND msn.seenAt IS NOT NULL
        GROUP BY u.gender;
        """
        cur.execute(query)
        results = cur.fetchall()
        print(f"{'Gender':<10} {'Average Response Time (seconds)':<30}")
        print("-" * 40)
        for row in results:
            gender, avg_response_time = row
            print(f"{gender:<10} {avg_response_time:<30}")
    except p.MySQLError as e:
        print("Error executing query:", e)
    except Exception as e:
        print("An unexpected error occurred:", e)

if __name__ == '__main__':
    
    Username=input("Enter username: ")
    Password=input("Enter password: ")
    try:
        con = p.connect(
            host='localhost',
            user=Username,
            password=Password,
            database='ProjectP4'
        )
        cur = con.cursor()
    except p.MySQLError as e:
        print("Error connecting to the database:", e)
        exit()
    
    commands=["Retrieve Users by gender","Retrieve posts made by user","Retrieve messages between two users","Project usernames older than a certain age","Project posts by visbility","Project reply ids of replies made by a user","Count comments made by a user","Average followers across all pages","Search for a group by groupname","Search for an event by eventname","Update visibility of a post","Update phone number of a user","Update event time","Delete a group by groupname","Delete media links of a post","Create a new user","Add a reaction to a Post/Comment/Reply","Analyze user age distribution for each group","Analyze the average response time for each gender","Analyze the average number of comments for all posts grouped by gender","Exit"]
   
    while True:
        for i in range(len(commands)):
            print(str(i+1)+". "+commands[i])
        print("")
        command_no=int(input("Enter the command number: "))
        print("")
        if command_no == 1:
            get_users_by_gender()
        elif command_no == 2:
            get_posts_by_user()
        elif command_no == 3:
            get_messages_between_users()
        elif command_no == 4:
            get_usernames_by_age()
        elif command_no == 5:
            get_content_of_posts_by_visibility()
        elif command_no == 6:
            get_reply_ids_of_user()
        elif command_no == 7:
            count_comments_by_userid()
        elif command_no == 8:
            average_followers_for_pages()
        elif command_no == 9:
            search_groupname_by_word()
        elif command_no == 10:
            search_event_by_word()
        elif command_no == 11:
            update_post_visibility()
        elif command_no == 12:
            update_user_phone_number()
        elif command_no == 13:
            update_event_time()
        elif command_no == 14:
            delete_group_by_name()
        elif command_no == 15:
            delete_media_links()
        elif command_no == 16:
            insert_user()
        elif command_no == 17:
            add_reaction() 
        elif command_no == 18:
            analyze_user_age_distribution()
        elif command_no == 19:
            analyze_average_response_time()
        elif command_no == 20:
            analyze_average_comments_per_post()
        elif command_no == 21:
            break 
        print("")
        