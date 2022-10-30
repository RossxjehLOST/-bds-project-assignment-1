import random
from random import randint

#stolen and customized to fit my needs

first_names = ['Adolf','Marian','Jiri','Laszlo','Reinhardt','Chloe','Raiden','David','Haruka','Janko','Dominik','Bibiana','Kuba','Ramona','Raider']
last_names = ['Floyd','Kotleba','Okamura','Bdsm','Chink','Laska','Cejka','Chungus','Sus','Chad','Soyak','Bichtits','Flowers','Rask','Marchand','Kockoholka','Legendary','Daubeny','Tranny']
citys = ['New Orleans','Bern','Vienna','Denver','Havana','Riga','Madrid','Gold Coast','Bruges','Brno','Canberra','Bratislava','Praha','Baku','Shanghai','Dublin']
streets = ['Market Street','Bay View Street','Coach Passage','Great Route','Purkynova','Saffron Route','Ocean Avenue','Lime Street','Quarry Boulevard','City Street','Art Lane','Lilypad Street','Windmill Ave','Brookmere Road','Fregata Passage']
payments = ['Card','Cash','Bitcoin']
shippings = ['Standard','Express']
companies = ['DLH','Packeta','GLS','PPL']
items = ['Computer','Notebook','Computer and notebook','Some kind of accesory']




for i in range(1, 56):
    first_name = first_names[randint(0,len(first_names)-1)]
    last_name = last_names[randint(0,len(last_names)-1)]
    email = f"{last_name}.{first_name}.{random.randrange(111, 999)}@gmail.com"
    payment = payments[randint(0,len(payments)-1)]
    shipping = shippings[randint(0,len(shippings)-1)]
    company = companies[randint(0,len(companies)-1)]
    item = items[randint(0,len(items)-1)]
    bit = randint(0,1) # for simple yes/no values
    phone = random.randrange(111111111, 999999999)
    city = citys[randint(0,len(citys)-1)]
    street = streets[randint(0,len(streets)-1)]
    zip = random.randrange(11111, 99999)
    house = random.randrange(111, 999)
    yy = random.randrange(2022, 2024)
    mm = random.randrange(1, 13)
    dd = random.randrange(1, 32)
    h = random.randrange(1, 24)
    m = random.randrange(1, 60)
    s = random.randrange(1, 60)

    # print(f"INSERT INTO person (name, surename, email, bio, profile_picture, is_student, is_vip, phone_number) VALUES ('{first_name}','{last_name}','{email}',NULL, NULL,'{bit}','{bit}','{phone}');")
    # print(f"INSERT INTO address (city, zip_code, street, home_number, optional_information) VALUES ('{city}', '{zip}', '{street}', '{house}', NULL);")
    # print(f"INSERT INTO login (is_login_true, is_acount_active) VALUES ('{bit}','{bit}');")
    # print(f"INSERT INTO person_has_login (id_person, id_login, last_time_acount_loged_in) VALUES ('{i}','{i}','{yy}-{mm}-{dd} {h}:{m}:{s}');")
    # print(f"INSERT INTO payment (was_payment_succesfull, type_of_payment, date_of_payment, has_money_back_thing, fk_id_payment_person) VALUES ('{bit}','{payment}','{yy}-{mm}-{dd}','{bit}','{i}');")
    # print(f"INSERT INTO shipping (type_of_shipping, was_payment_succesfull, expected_date_of_shipping, company_that_will_ship_the_order, is_address_valid, fk_id_shipping_payment, fk_id_shipping_address) VALUES ('{shipping}','{bit}','{yy}-{mm}-{dd}','{company}','1','x','{i}');")
    print(f"INSERT INTO cart_info (item, has_valid_shiping, was_payment_succesfull, fk_id_cart_info_shipping, fk_id_cart_info_payment, fk_id_cart_info_person) VALUES ('{item}','1','1');")



    # you can pick what you want to generate by uncommenting one of the lines above