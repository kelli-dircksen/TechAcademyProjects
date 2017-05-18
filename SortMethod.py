def sort_method(my_list):
    for passnum in range(len(my_list)-1,0,-1):
        for i in range(passnum):
            if my_list[i]>my_list[i+1]:
                temp = my_list[i]
                my_list[i] = my_list[i+1]
                my_list[i+1] = temp

my_list = [89, 23, 33, 45, 10, 12, 45, 45, 45]
sort_method(my_list)
print(my_list)
